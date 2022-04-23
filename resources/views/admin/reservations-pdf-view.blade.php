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

    <div class="container-fluid">
        @foreach ($customers as $customer)
            <div class="border border-dark rounded p-2">
                <p>Date: {{ $customer->function_date }}</p>
                <table style="width: 100%">
                    <tr>
                        <td>Bill No: {{ $customer->branch->prefix }}{{ $customer->bill_number }}</td>
                        <td class="text-right">Name: {{ $customer->name }}</td>
                        <td class="text-right">Function Place: {{ $customer->function_place }}</td>
                    </tr>

                    <tr>
                        <td>Dressing Type: @if($customer->dressing_place == 1) In @else Out @endif</td>
                        <td  colspan="2">Going Away Change: @if($customer->going_away_change_place == NULL) Yes @else {{$customer->going_away_change_place}} @endif</td>
                    </tr>

                    <tr>
                        <td>No of BestMen: {{ $customer->no_of_bestmen }}</td>
                        <td  colspan="2">No of PageBoys: {{ $customer->no_of_pageboys }}</td>
                    </tr>
                </table>
                <hr>
                <div>
                    <table>
                        @foreach ($customer->dress_selections as $dress_selection)
                            <tr>
                                <td>{{ $dress_selection->type }}</td>
                                <td style="padding-left: 20px">{{ $dress_selection->name }}</td>
                            </tr>
                        @endforeach
                    </table>
                </div>
                <hr>
                <div>
                    <ul>Notes:
                        @foreach ($customer->notes as $note)
                            <li style='font-size: 12px; font-family:Consolas, "Andale Mono WT", "Andale Mono", "Lucida Console", "Lucida Sans Typewriter", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Liberation Mono", "Nimbus Mono L", Monaco, "Courier New", Courier, monospace;'>{{ $note->note }}</li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <br>
        @endforeach
    </div>
</body>
</html>