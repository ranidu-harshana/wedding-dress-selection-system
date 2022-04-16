<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\User;
use App\Models\Customer;
use App\Models\DressSelection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Auth;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        
        if($user->role->name == 'admin') {
            $customers = Customer::all();
        }else{
            $customers = $user->customers;
        }
        return view('admin.all-customers', ['customers'=>$customers]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $user = auth()->user();

        if($user->role->name == 'admin') {
            $branches = Branch::all();
        }else{
            $branches = $user->branches;
        }
        return view('admin.create-bill', ['branches'=>$branches]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'bill_number' => ['required', 'unique:customers,bill_number'],
            'branch_id' => ['required'],
            'name' => ['required'],
            'address' => ['required'],
            'mobile_no1' => ['required'],
            'mobile_no2' => ['nullable'],
            'function_date' => ['required'],
            'function_place' => ['required'],
            'no_of_bestmen' => ['required'],
            'no_of_pageboys' => ['required'],
            'dressing_place' => ['required'],
            'going_away_change_place' => ['nullable'],
            'bridal_dressing_place' => ['nullable'],
            'bridal_color' => ['nullable'],
            'sec_bridal_group_color' => ['nullable'],
            'photography_place' => ['nullable'],
            'total_amount' => ['required'],
            'discount' => ['nullable'],
            'advance_payment' => ['nullable'],
        ]);

        $user_id = Auth::user()->id;
        $user = User::find($user_id);
        
        if($user->customers()->create($validated)) {
            session()->flash('bill-created', 'Bill Created');
        }else{
            session()->flash('failed', 'failed');
        }
        
        return redirect()->route('customer.index');
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $customer = Customer::find($id);
        $notes = $customer->notes;

        $dress_selected_customer = $customer->dress_selections;
        if($dress_selected_customer->toArray() == NULL){
            $dress_selected_customer = NULL;
        }
        return view('admin.customer-profile', ['customer'=>$customer, 'notes'=>$notes, 'dress_selected_customer'=>$dress_selected_customer]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = auth()->user();

        if($user->role->name == 'admin') {
            $branches = Branch::all();
        }else{
            $branches = $user->branches;
        }
        $customer = Customer::find($id);
        return view('admin.edit-bill', ['customer'=>$customer, 'branches'=>$branches]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validated = $request->validate([
            'branch_id' => ['required'],
            'name' => ['required'],
            'address' => ['required'],
            'mobile_no1' => ['required'],
            'mobile_no2' => ['nullable'],
            'function_date' => ['required'],
            'function_place' => ['required'],
            'no_of_bestmen' => ['required'],
            'no_of_pageboys' => ['required'],
            'dressing_place' => ['required'],
            'going_away_change_place' => ['nullable'],
            'bridal_dressing_place' => ['nullable'],
            'bridal_color' => ['nullable'],
            'sec_bridal_group_color' => ['nullable'],
            'photography_place' => ['nullable'],
        ]);

        $customer = Customer::find($id);
        $customer->update($validated);
        return redirect()->route('customer.show', $id);
    }


    function edit_measurment_date(Request $request, $id) {
        $customer = Customer::find($id);
        $result = $customer->update([
            'measurement_date' => $request->measurement_date,
        ]);

        if($result) {
            session()->flash('measurment-date-updated', 'Measurment Date Updated');
            return back();
        }else{
            dd("FAILED");
        }
    }

    function postpone(Request $request, $id) {
        $customer = Customer::find($id);
        $function_date = $customer->function_date;

        $result = $customer->update([
            'function_date' => $request->postpone_date,
            'postponed' => $function_date,
        ]);

        if($result) {
            session()->flash('function-posponed', 'Function Date Posponed');
            return back();
        }else{
            dd("FAile");
        }
    }

    public function autocomplete_function_place(Request $request)
    {
        $data = Customer::select('function_place')
                    ->where('function_place','LIKE',"%{$request->term0}%")
                    ->pluck('function_place');
        $values = array_values($data->toArray());

        return response()->json($values);
    }

    public function autocomplete_brida_place(Request $request)
    {
        $data = Customer::select('bridal_dressing_place')
                    ->where('bridal_dressing_place','LIKE',"%{$request->term}%")
                    ->pluck('bridal_dressing_place');
        $values = array_values($data->toArray());

        return response()->json($values);
    }

    public function autocomplete_photography_place(Request $request)
    {
        $data = Customer::select('photography_place')
                    ->where('photography_place','LIKE',"%{$request->term1}%")
                    ->pluck('photography_place');
        $values = array_values($data->toArray());

        return response()->json($values);
    }

    public function get_all_func_dates() {
        $all_dates = Customer::select('function_date')->get();
        $dates = array_values($all_dates->toArray());
        $date_arr = [];
        foreach ($dates as $key => $value) {
            array_push($date_arr, $value['function_date']);
        }
        return response()->json($date_arr);
    }

    public function get_functions_of_day(Request $request) {
        $arr = [];
        $customers = Customer::where('function_date', '=', "{$request->date}")->get();
        foreach ($customers as $customer) {
            $data_arr = [];
            $name = $customer->name;
            $postponed = $customer->postponed;
            if ($postponed == NULL) {
                $postponed = "NO";
            }
            $data_arr['name'] = $name;
            $data_arr['postponed'] = $postponed;
            $data_arr['customer_id'] = $customer->id;
            $data_arr['bill_number'] = $customer->branch->prefix.''.$customer->bill_number;
            $data_arr['status'] = $customer->status;
            array_push($arr, $data_arr);
        }
        return response()->json($arr);
    }

    public function cancel($id) {
        $customer = Customer::find($id);
        $customer->update([
            'status' => 0,
        ]);
        return back();
    }
    
    public function re_schedule($id) {
        $customer = Customer::find($id);
        $customer->update([
            'status' => 1,
        ]);
        return back();
    }

    public function show_wedding_reservations_report() {
        return view('admin.wedd-reservation-report');
    }

    public function reservation_report_pdf (Request $request) {
        $from_date = $request->from_date;
        $to_date = $request->to_date;
        if ($to_date == NULL) {
            $customers = Customer::where('function_date', '=', $from_date)->get();
        }elseif ($from_date == NULL) {
            $customers = Customer::where('function_date', '=', $to_date)->get();
        }elseif ($to_date != NULL && $from_date != NULL){
            $customers = Customer::where('function_date', '>=', $from_date)->where('function_date', '<=', $to_date)->get();
        }

        $pdf = App::make('dompdf.wrapper');
        $pdf->loadView('admin.reservations-pdf-view', ['from_date'=>$from_date, 'to_date'=>$to_date, 'customers'=>$customers]);
        return $pdf->stream();
    }

    public function show_wedding_reservations_report_finance() {
        return view('admin.wedding-details-report-finance');
    }

    public function reservation_report_pdf_finance_month(Request $request) {
        $customers = Customer::where('function_date', 'LIKE', "%{$request->month}%")->get();

        $pdf = App::make('dompdf.wrapper');
        $pdf->loadView('admin.wedding-details-report-finance-pdf', ['customers'=>$customers]);
        return $pdf->stream();
    }

    public function reservation_report_pdf_finance_range(Request $request) {
        $from_date = $request->from_date;
        $to_date = $request->to_date;
        if ($to_date == NULL) {
            $customers = Customer::where('function_date', '=', $from_date)->get();
        }elseif ($from_date == NULL) {
            $customers = Customer::where('function_date', '=', $to_date)->get();
        }elseif ($to_date != NULL && $from_date != NULL){
            $customers = Customer::where('function_date', '>=', $from_date)->where('function_date', '<=', $to_date)->get();
        }

        $pdf = App::make('dompdf.wrapper');
        $pdf->loadView('admin.wedding-details-report-finance-pdf', ['customers'=>$customers]);
        return $pdf->stream();
    }
}