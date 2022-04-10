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

                @if (auth()->check())
                    @if (auth()->user()->is_admin())
                        <li class="submenu">
                            <a href="#"><i class="fa fa-user"></i> <span> Master </span> <span><i class="fas fa-caret-down"></i></span></a>
                            <ul style="display: none;">
                                <li><a href="{{ route('item_category.index') }}">Item Category</a></li>
                                <li><a href="{{ route('item.create') }}">Create Item</a></li>
                                <li><a href="{{ route('branch.index') }}">Branch</a></li>
                            </ul>
                        </li>
                    @endif
                @endif

                <li>
                    <a href="{{ route('item.index') }}"><i class="fas fa-warehouse"></i> <span>Inventory</span></a>
                </li>

                @if (auth()->check())
                    @if (auth()->user()->is_admin())
                        <li>
                            <a href="{{ route('register') }}"><i class="fas fa-user"></i> <span>Create User</span></a>
                        </li>
                    @endif
                @endif
            </ul>
        </div>
    </div>
</div>