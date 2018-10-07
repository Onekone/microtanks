if os_type == os_android {
    
    if ww/hh >= 1.1 {
        _dpadX = __x*0.1875; _dpadY = __y/2;
        _abX = __x*0.8125; _abY = __y/2;
        _selX = 12; _selY = 16;
        _startX = __x-12; _startY = 16;}
     else {
        _dpadX = __x*0.25; _dpadY = __y-48;
        _abX = __x*0.75; _abY = __y-48;
        _selX = 12; _selY = 24;
        _startX = __x-12; _startY = 24;}
    
    virtualKeysList[4] = virtual_key_add( _abX-18-12 , _abY-12 , 24, 24, global.input_key[0,key_a])            
    virtualKeysList[5] = virtual_key_add( _abX+18-12 , _abY-12 , 24, 24, global.input_key[0,key_b])     
    virtualKeysList[6] = virtual_key_add( _selX-12 , _selY-12 , 24, 24, vk_f2)             
    virtualKeysList[7] = virtual_key_add( _startX-12   , _startY-12 , 24, 24, global.input_key[0,key_start])         

    }
