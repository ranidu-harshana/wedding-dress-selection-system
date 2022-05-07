<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dresses Frequency Report</title>
</head>
<body>
    <table class="table table-sm table-bordered table-striped">
        <thead>
            <tr>
                <th scope="col">Code</th>
                <th scope="col">Type</th>
                <th scope="col">Name</th>
                <th scope="col">Frequency</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($dresses as $dress => $other)
                <tr>
                    <td>{{ explode(' - ', $dress)[0]  }}</td>
                    <td>
                        @php
                            try {
                                $type = explode(' - ', $other[1])[0];
                            } catch (\Throwable $th) {
                                $type = $other[1];
                            }
                        @endphp
                        {{ $type }}
                    </td>
                    <td>{{ explode(' - ', $dress)[1]  }}</td>
                    <td>{{ $other[0] }}</td>    
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>