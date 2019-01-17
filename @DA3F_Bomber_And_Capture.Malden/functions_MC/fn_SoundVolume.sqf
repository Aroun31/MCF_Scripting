    /*
    *
    *       Project :
    *               Mission 01
    *
    *       Team   :
    *               Dev'Arma 3 France / http://devarma3france.fr/
    *
    *       Author  :
    *               [DA3F] Aroun Le BriCodeur
    *
    *       File :
    *           fn_SoundVolume.sqf
    *
    *       DESCRIPTION :
    *               -------------
    *       ARGUMENTS :
    *               -------------
    *       EXEMPLES :
    *               -------------
    *
    */

  params[["_DA3F_type","",[""]]];

    switch (_DA3F_type) do {
        case "up": {
        switch (soundVolume) do {
                case (.1): {
                   0.5 fadeSound 0.2;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.2): {
                   0.5 fadeSound 0.4;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.4): {
                   0.5 fadeSound 0.6;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.6): {
                   0.5 fadeSound 0.8;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.8): {
                   0.5 fadeSound 1;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (1): {
                   0.5 fadeSound 0.1;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
            };
        };
        case "down": {
        switch (soundVolume) do {
                case (1): {
                   0.5 fadeSound 0.8;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.8): {
                   0.5 fadeSound 0.6;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.6): {
                   0.5 fadeSound 0.4;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.4): {
                   0.5 fadeSound 0.2;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.2): {
                   0.5 fadeSound 0.1;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
                case (.1): {
                   0.5 fadeSound 1;
                  _msg = format["<t font='PuristaMedium' size='0.8' color='#D3D3D3'>Volume environnant :</t><t font='PuristaMedium' size='0.9'  color='#16C500' >%1%2</t>",(soundVolume * 100),"%"];
                  [_msg,0.65,0.85,3,0.5] spawn BIS_fnc_dynamicText;
                };
            };
        };
    };
