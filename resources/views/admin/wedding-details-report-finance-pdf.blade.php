<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <table class="table table-sm table-bordered table-striped">
        <thead>
            <tr>
                <th scope="col">Bill No</th>
                <th scope="col">Name</th>
                <th scope="col">Booked Date</th>
                <th scope="col">Total Bill</th>
                <th scope="col">Advance Payment</th>
                <th scope="col">Balance</th>
            </tr>
        </thead>
        <tbody>
            @php 
                $tot_total_amount = 0;
                $tot_advance_payment = 0;
                $tot_balance = 0;
            @endphp
            @foreach ($customers as $customer)
                <tr>
                    <th scope="row">{{ $customer->branch->prefix }}{{ $customer->bill_number }}</th>
                    <td>{{ $customer->name }}</td>
                    <td>{{ $customer->created_at }}</td>
                    <td class="text-right">{{ $customer->total_amount }}</td>
                    <td class="text-right">{{ $customer->advance_payment }}</td>
                    <td class="text-right">{{ $customer->total_amount - ($customer->advance_payment + $customer->discount) }}</td>
                </tr>
                @php
                    $tot_total_amount += $customer->total_amount;
                    $tot_advance_payment += $customer->advance_payment;
                    $tot_balance += $customer->total_amount - ($customer->advance_payment + $customer->discount)
                @endphp
            @endforeach
            
            <tr>
                <th scope="row" colspan="3" class="text-center">Total</th>
                <td class="text-right">{{ $tot_total_amount }}</td>
                <td class="text-right">{{ $tot_advance_payment }}</td>
                <td class="text-right">{{ $tot_balance }}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>