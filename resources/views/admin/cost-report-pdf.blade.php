<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Cost Report</title>
</head>
<body>
    <table class="table table-sm table-bordered table-striped">
        <thead>
            <tr>
                <th scope="col">Bill No</th>
                <th scope="col">Name</th>
                <th scope="col">Total Amount</th>
                <th scope="col">Transport</th>
                <th scope="col">Salary</th>
                <th scope="col">Cleaning</th>
                <th scope="col">Depriciation</th>
            </tr>
        </thead>
        <tbody>
            @php 
                $tot_total_amount = 0;
                $tot_additional_payment = 0;
                $tot_transport = 0;
                $tot_salary = 0;
                $tot_cleaning = 0;
                $tot_depriciation = 0;
            @endphp
            @foreach ($customers as $customer)
                @php $additional_payment = 0; @endphp
                @foreach ($customer->additional_payments as $payment)
                    @php $additional_payment += $payment->additional_payment; @endphp
                @endforeach
                <tr>
                    <th scope="row">{{ $customer->branch->prefix }}{{ $customer->bill_number }}</th>
                    <td>{{ $customer->name }}</td>
                    <td class="text-right">{{ $customer->total_amount +$additional_payment }}</td>
                    <td class="text-right">@if ($customer->cost != NULL) {{ $customer->cost->transport }} @else 0 @endif </td>
                    <td class="text-right">@if ($customer->cost != NULL) {{ $customer->cost->salary }} @else 0 @endif </td>
                    <td class="text-right">@if ($customer->cost != NULL) {{ $customer->cost->cleaning }} @else 0 @endif </td>
                    <td class="text-right">@if ($customer->cost != NULL) {{ $customer->cost->depriciation }} @else 0 @endif </td>
                </tr>
                @php
                    $tot_total_amount += $customer->total_amount;
                    $tot_additional_payment += $additional_payment;
                    if ($customer->cost != NULL) {
                        $tot_transport += $customer->cost->transport;
                        $tot_salary += $customer->cost->salary;
                        $tot_cleaning += $customer->cost->cleaning;
                        $tot_depriciation += $customer->cost->depriciation;
                    }
                @endphp
            @endforeach
            
            <tr>
                <th scope="row" colspan="2" class="text-center">Total</th>
                <td class="text-right">{{ $tot_total_amount + $tot_additional_payment }}</td>
                <td class="text-right">{{ $tot_transport }}</td>
                <td class="text-right">{{ $tot_salary }}</td>
                <td class="text-right">{{ $tot_cleaning }}</td>
                <td class="text-right">{{ $tot_depriciation }}</td>
            </tr>

            <tr>
                <th scope="row" colspan="2" class="text-center">Net Income</th>
                <td class="text-center" colspan="5">{{ ($tot_total_amount + $tot_additional_payment) - ($tot_transport+$tot_salary+$tot_cleaning+$tot_depriciation) }}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>