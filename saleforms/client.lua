-- Scaleform: mp_car_stats_01/SET_VEHICLE_INFOR_AND_STATS (vehicle stats like speed, acceleration, braking, traction etc)

Citizen.CreateThread(function()
    function Initialize(scaleform)
        scaleform = RequestScaleformMovie(scaleform)
        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end
        PushScaleformMovieFunction(scaleform, "SET_VEHICLE_INFOR_AND_STATS")
        PushScaleformMovieFunctionParameterString("RE-7B")
        PushScaleformMovieFunctionParameterString("Tracked and Insured")
        PushScaleformMovieFunctionParameterString("MPCarHUD")
        PushScaleformMovieFunctionParameterString("Annis")
        PushScaleformMovieFunctionParameterString("Top Speed")
        PushScaleformMovieFunctionParameterString("Acceleration")
        PushScaleformMovieFunctionParameterString("Braking")
        PushScaleformMovieFunctionParameterString("Traction")
        PushScaleformMovieFunctionParameterInt(68)
        PushScaleformMovieFunctionParameterInt(60)
        PushScaleformMovieFunctionParameterInt(40)
        PushScaleformMovieFunctionParameterInt(70)
        PopScaleformMovieFunctionVoid()

        return scaleform
    end
    scaleform = Initialize("mp_car_stats_01")
    while true do
        Citizen.Wait(0)
        veh = GetVehiclePedIsUsing(PlayerPedId())
        veh2 = GetPlayersLastVehicle()
        ped = PlayerPedId()
        x,y,z = table.unpack(GetEntityCoords(veh2, true))
        xrot,yrot,zrot = table.unpack(GetEntityRotation(veh2, 1))
        DrawScaleformMovie_3d(scaleform, x,y,z+5.0, xrot, 180.0, zrot, 0.0, 1.0, 0.0, 5.0, 4.0, 5.0, 0)
        -- or
		    -- DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
    end
end)

-- Scaleform: POPUP_WARNING (Classic black screen, big title and text details)

Citizen.CreateThread(function()
    function drawscaleform(scaleform)
        scaleform = RequestScaleformMovie(scaleform)
        while not HasScaleformMovieLoaded(scaleform) do
            Citizen.Wait(0)
        end
        
        PushScaleformMovieFunction(scaleform, "SHOW_POPUP_WARNING")
        PushScaleformMovieFunctionParameterFloat(500.0)
        PushScaleformMovieFunctionParameterString("ALERT")
        PushScaleformMovieFunctionParameterString("This is a pretty neat scaleform")
        PushScaleformMovieFunctionParameterString("~r~Colours work too!")
        PushScaleformMovieFunctionParameterBool(true)
        PushScaleformMovieFunctionParameterInt(0)
        PopScaleformMovieFunctionVoid()

        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
    end
    while true do
        Citizen.Wait(0)
        drawscaleform("POPUP_WARNING")
    end
end)

-- Scaleform: SET_RANK_SCORES (Hud rank/level bar)

Citizen.CreateThread(function()
    function Initialize(currentRankLimit, nextRankLimit, playersPreviousXP, playersCurrentXP, rank)
        local scaleform = RequestHudScaleform(19)

        while not HasHudScaleformLoaded(scaleform) do
            Citizen.Wait(0)
        end

        PushScaleformMovieFunctionFromHudComponent(scaleform, "SET_RANK_SCORES")
        PushScaleformMovieFunctionParameterInt(currentRankLimit)
        PushScaleformMovieFunctionParameterInt(nextRankLimit)
        PushScaleformMovieFunctionParameterInt(playersPreviousXP)
        PushScaleformMovieFunctionParameterInt(playersCurrentXP)
        PushScaleformMovieFunctionParameterInt(rank) -- rank
        PopScaleformMovieFunctionVoid()

        PushScaleformMovieFunctionFromHudComponent(scaleform, "SET_COLOUR")
        PushScaleformMovieFunctionParameterInt(116)
        PopScaleformMovieFunctionVoid()


        return scaleform
    end
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 47) then
            scaleform = Initialize(200, 2000, 200, 500, 2)
        end
    end
end)
