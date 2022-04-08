@extends('layouts.app')

@section('content')
<div id="container">
    <div id="header">
        <div id="monthDisplay"></div>
        <div>
            <button id="backButton" class="btn btn-primary calender_button"><i class="fa-solid fa-arrow-left-long" style="margin-right: 2px;"></i>Back</i></button>
            <button id="nextButton" class="btn btn-primary calender_button">Next<i class="fa-solid fa-arrow-right-long" style="margin-left: 2px"></i></button>
        </div>
    </div>

    <div id="weekdays">
        <div>Sunday</div>
        <div>Monday</div>
        <div>Tuesday</div>
        <div>Wednesday</div>
        <div>Thursday</div>
        <div>Friday</div>
        <div>Saturday</div>
    </div>

    <div id="calendar"></div>
</div>
    <div id="deleteEventModal">
        <h2>Event</h2>

        
        <div id="display_area"></div>
        
        <button id="closeButton" class="calender_button">Close</button>
    </div>

    <div id="modalBackDrop"></div>
    <!-- <script src="./script.js"></script> -->
    {{-- <script src="jquery.js"></script> --}}
    <script>
        let nav = 0;
        const backDrop = document.getElementById('modalBackDrop');
        const weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

            let events = localStorage.getItem('events') ? JSON.parse(localStorage.getItem('events')) : [];
        date_arr = ['2022-4-5', '2022-4-7', '2022-4-8', '2022-4-10', '2022-4-11']
        for (let index = 0; index < 5; index++) {
            events.push({
                date: date_arr[index],
                title: 'Hello',
            });
            
        }
        

        localStorage.setItem('events', JSON.stringify(events));

        function load() {
            const dt = new Date();

            if (nav !== 0) {
                dt.setMonth(new Date().getMonth() + nav);
            }

            const day = dt.getDate();
            const month = dt.getMonth();
            const year = dt.getFullYear();

            const firstDayOfMonth = new Date(year, month, 1);
            const daysInMonth = new Date(year, month + 1, 0).getDate();
            
            const dateString = firstDayOfMonth.toLocaleDateString('en-us', {
                weekday: 'long',
                year: 'numeric',
                month: 'numeric',
                day: 'numeric',
            });
            const paddingDays = weekdays.indexOf(dateString.split(', ')[0]);

            document.getElementById('monthDisplay').innerText = 
                `${dt.toLocaleDateString('en-us', { month: 'long' })} ${year}`;

            calendar.innerHTML = '';

            for(let i = 1; i <= paddingDays + daysInMonth; i++) {
                const daySquare = document.createElement('div');
                daySquare.classList.add('day');

                const dayString = `${year}-${month + 1}-${i - paddingDays}`;

                if (i > paddingDays) {
                    daySquare.innerText = i - paddingDays;
                    const eventForDay = events.find(e => e.date === dayString);

                    if (i - paddingDays === day && nav === 0) {
                        daySquare.id = 'currentDay';
                    }

                    if (eventForDay) {
                        const eventDiv = document.createElement('div');
                        eventDiv.classList.add('event');
                        eventDiv.innerText = eventForDay.title;
                        daySquare.appendChild(eventDiv);
                    }
                        daySquare.addEventListener('click', () => openModal(dayString));
                } else {
                    daySquare.classList.add('padding');
                }

                calendar.appendChild(daySquare);    
            }
        }

        function openModal(date) {
            clicked = date;
            console.log(clicked);
            const eventForDay = events.find(e => e.date === clicked);
            
            $.ajax({
                url: "../test",
                type: "POST",
                data: {
                    "_token": "{{ csrf_token() }}",
                    "display" : 1,
                    "date": clicked,
                },
                success: function(data){
                    html = ''
                    data.forEach(element => {
                        html += '<div class="row"><span style="height: 25px; width: 25px; background-color: red; border-radius: 50%;"></span><p>';
                        html += element.name
                        html += '</p></div>'
                    });
                    deleteEventModal.style.display = 'block';
                    backDrop.style.display = 'block';
                    $("#display_area").html(html);
                }
            })
            // if (eventForDay) {
            // 	document.getElementById('display_area').innerHTML = "<h1>ji</h1>";
            // 	deleteEventModal.style.display = 'block';
            // } 
        }

        function closeModal() {
            deleteEventModal.style.display = 'none';
            backDrop.style.display = 'none';
            clicked = null;
            load();
        }

        function initButtons() {
            document.getElementById('nextButton').addEventListener('click', () => {
                nav++;
                load();
            });

            document.getElementById('backButton').addEventListener('click', () => {
                nav--;
                load();
            });

            document.getElementById('closeButton').addEventListener('click', closeModal);
        }
        load();
        initButtons();
    </script>
@endsection