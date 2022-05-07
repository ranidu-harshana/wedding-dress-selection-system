<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Measurement Report</title>
</head>
<body>
    @foreach ($customers as $customer)
        @if ($customer->measurements()->count() > 0)
            <table class="table table-sm table-bordered table-striped">
                <thead>
                    <tr>
                        <td colspan="10">
                            <b>Bill Number:</b> {{ $customer->branch->prefix }}{{ $customer->bill_number }}<br>
                            <b>Customer Name:</b> {{ $customer->name }}<br>
                            <b>Function Date:</b> {{ $customer->function_date }}
                        </td>
                    </tr>
                    <tr>
                        <th scope="col" style="width: 120px">POS</th>
                        <th scope="col">Head</th>
                        <th scope="col">Shoulder</th>
                        <th scope="col">Chest</th>
                        <th scope="col">Weist</th>
                        <th scope="col">T.Length</th>
                        <th scope="col">S.Size</th>
                        <th scope="col">ARM</th>
                        <th scope="col">J.Height</th>
                        <th scope="col">Other</th>
                    </tr>
                </thead>
                <tbody>
                    
                    @foreach ($customer->measurements as $measurement)
                        <tr>
                            <td scope="col">{{ $measurement->type }}</td>
                            <td scope="col">
                                @if ($measurement->head == NULL)
                                    0
                                @else
                                    {{ $measurement->head }}
                                @endif
                            </td>
                            <td scope="col">
                                @if ($measurement->shoulder == NULL)
                                    0
                                @else
                                    {{ $measurement->shoulder }}
                                @endif
                            </td>
                            <td scope="col">
                                @if ($measurement->chest == NULL)
                                    0
                                @else
                                    {{ $measurement->chest }}
                                @endif
                            </td>
                            <td scope="col">
                                @if ($measurement->weist == NULL)
                                    0
                                @else
                                    {{ $measurement->weist }}
                                @endif
                            </td>
                            <td scope="col">
                                @if ($measurement->tlength == NULL)
                                    0
                                @else
                                    {{ $measurement->tlength }}
                                @endif
                            </td>
                            <td scope="col">
                                @if ($measurement->ssize == NULL)
                                    0
                                @else
                                    {{ $measurement->ssize }}
                                @endif
                            </td>
                            <td scope="col">
                                @if ($measurement->arm == NULL)
                                    0
                                @else
                                    {{ $measurement->arm }}
                                @endif
                            </td>
                            <td scope="col">
                                @if ($measurement->jheight == NULL)
                                    0
                                @else
                                    {{ $measurement->jheight }}
                                @endif
                            </td>
                            <td scope="col">
                                @if ($measurement->other == NULL)
                                    0
                                @else
                                    {{ $measurement->other }}
                                @endif
                            </td>
                        </tr>
                    @endforeach
                @endif
                    
            </tbody>
        </table><br>
    @endforeach
    
</body>
</html>