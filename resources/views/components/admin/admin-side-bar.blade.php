<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title">Main</li>
                <li class="active">
                    <a href="{{ route('home') }}"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a>
                </li>

                <li>
                    <a href="{{ route('customer.create') }}"><i class="fas fa-clipboard-list"></i> <span>Create New</span></a>
                </li>

                <li>
                    <a href="{{ route('customer.index') }}"><i class="fas fa-users"></i> <span>Events List</span></a>
                </li>

                
                <li class="submenu">
                    <a href="#"><i class="fa fa-user"></i> <span> Master </span> <span><i class="fas fa-caret-down"></i></span></a>
                    <ul style="display: none;">
                        @if (auth()->user()->role->name == "admin" || auth()->user()->role->name == "manager")
                            @if (auth()->check())
                                @if (auth()->user()->is_admin())
                                    <li><a href="{{ route('item_category.index') }}">Item Category</a></li>
                                @endif
                            @endif
                            @if (auth()->user()->role->name == "admin" || auth()->user()->role->name == "manager")
                                <li><a href="{{ route('item.create') }}">Create Item</a></li>
                            @endif
                            @if (auth()->check())
                                @if (auth()->user()->is_admin())
                                    <li><a href="{{ route('branch.index') }}">Branch</a></li>
                                @endif
                            @endif
                        @endif 
                        <li>
                            <a href="{{ route('item.index') }}"> Inventory</a>
                        </li>
                    </ul>
                </li>
                  

                @if (auth()->user()->is_admin())
                    <li class="submenu">
                        <a href="#"><i class="fa fa-user"></i> <span> User </span> <span><i class="fas fa-caret-down"></i></span></a>
                        <ul style="display: none;">
                            <li><a href="{{ route('register') }}"> <span>Create User</span></a></li>
                            <li><a href="{{ route('user.index') }}"> <span>All Users</span></a></li>
                        </ul>
                    </li>
                @endif

                <li class="submenu">
                    <a href="#"><i class="fas fa-book"></i> <span> Reports </span> <span><i class="fas fa-caret-down"></i></span></a>
                    <ul style="display: none;">
                        <li><a href="{{ route('wedding.reservations.report.show') }}">Wedding Reservation</a></li>
                        <li><a href="{{ route('dress.index') }}">Reserved Items</a></li>
                        @if (auth()->check())
                            @if (auth()->user()->is_admin())
                                <li><a href="{{ route('wedding.reservations.report.show.finance') }}">Account Summary</a></li>
                                <li><a href="{{ route('show_cost_report_pdf') }}">Cost Summary</a></li>
                            @endif
                        @endif
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>