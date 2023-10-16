void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_M1Q1A01FireOnce") == FALSE &&
       GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualInProgress") &&
       //GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete") == FALSE &&
       GetDistanceBetween(GetObjectByTag("M1Q6A01Aribeth"),GetObjectByTag("WP_AribethRStart")) < 2.0 &&
       GetDistanceBetween(GetObjectByTag("M1Q6A01Fenthick"),GetObjectByTag("WP_FenthickRStart")) < 2.0 &&
       GetDistanceBetween(GetObjectByTag("M1Q6A01Desther"),GetObjectByTag("WP_DestherRStart")) < 2.0)
    {
        SignalEvent(OBJECT_SELF,EventUserDefined(600));
        SetLocalInt(OBJECT_SELF,"NW_G_M1Q1A01FireOnce",TRUE);
    }
}
