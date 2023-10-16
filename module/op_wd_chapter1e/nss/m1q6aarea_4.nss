void main()
{
    object oAribeth = GetLocalObject(OBJECT_SELF,"NW_L_oAribeth");
    object oDesther = GetLocalObject(OBJECT_SELF,"NW_L_oDesther");
    object oFenthick = GetLocalObject(OBJECT_SELF,"NW_L_oFenthick");
    location lLoc = GetLocation(GetObjectByTag("M1Q6A01Pool"));
    int nEvent = GetUserDefinedEventNumber();
    switch(nEvent)
    {
        case 600:
        {
            int nIdx;
            SetLocalObject(OBJECT_SELF,"NW_L_Blue",CreateObject(OBJECT_TYPE_PLACEABLE,"PLC_MAGICBLUE",GetLocation(oAribeth)));
            SetLocalObject(OBJECT_SELF,"NW_L_Red",CreateObject(OBJECT_TYPE_PLACEABLE,"PLC_MAGICRED",GetLocation(oDesther)));
            SetLocalObject(OBJECT_SELF,"NW_L_Purple",CreateObject(OBJECT_TYPE_PLACEABLE,"PLC_MAGICPURPLE",GetLocation(oFenthick)));
            for(nIdx = 0; nIdx <= 6; nIdx++)
            {
                AssignCommand(GetObjectByTag("M1Q6A01Torch_" + IntToString(nIdx)),
                              DelayCommand(IntToFloat(nIdx) * 1.0,PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE)) );
            }
            SignalEvent(oAribeth,EventUserDefined(610));
        }
        break;
        case 615:
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL),lLoc);
            DelayCommand(2.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SOUND_BURST),lLoc));
            DelayCommand(5.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUNBEAM),lLoc));
        }
        break;
        case 665:
        {
            int nIdx;
            object oHelmite;
            location lLoc;

            // * Modified February 19 2003
            // * Brent
            // * Making the portal that gets made 'plot'
            object oPortal = CreateObject(OBJECT_TYPE_PLACEABLE,"PLC_PORTAL",GetLocation(GetObjectByTag("WP_M1Q6APortal")));
            SetPlotFlag(oPortal, TRUE);
           for(nIdx = 1; nIdx <= 6; nIdx++)
            {
                lLoc = GetLocation(GetObjectByTag("WP_M1Q6A01HelmSpawn_0" + IntToString(nIdx)));
               oHelmite = CreateObject(OBJECT_TYPE_CREATURE,
                                       "M1Q6A01HELMITE",lLoc);
               ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2),lLoc);
            }
        }
        break;

    }

}
