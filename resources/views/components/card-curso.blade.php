@props(['rate' => 1,'img' => '/assets/images/small/img-1.jpg'])
<div class="col-sm-5 col-md-4">
    <div class="card shadow">
        <img class="card-img-top img-fluid card-img" src="{{URL::asset($img)}}" alt="Card image cap">
        <div class="card-body">
            <h4 class="card-title mt-0 mb-3">{{$titulo}}</h4>
            <p class="mb-2">{{$texto}}</p>
            <div class="rating-star mb-1">
                <input type="hidden" class="rating" data-filled="mdi mdi-star text-primary" data-empty="mdi mdi-star-outline text-muted" data-readonly value="{{$rate}}"/>
            </div>
            <div class="row">
                {{$button}}
            </div>
        </div>
    </div>
</div>