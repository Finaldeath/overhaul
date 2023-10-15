void main()
{
    if( (GetIsPC(GetEnteringObject()) ||
         GetIsObjectValid(GetMaster(GetEnteringObject()))) &&
        GetLocalInt(OBJECT_SELF,"NW_L_FireOnce") == FALSE )
    {
        SetLocalInt(OBJECT_SELF,"NW_L_FireOnce",TRUE);
        object oChief = GetNearestObjectByTag("M1Q0EGoblinChief");
        if(GetIsObjectValid(oChief) == FALSE ||
           GetIsDead(oChief))
        {
            SetLocalInt(GetArea(OBJECT_SELF),"NW_G_M1Q0CutScene",10);
            SignalEvent(GetNearestObjectByTag("M1Q0EDryad"),EventUserDefined(20));
        }
        else
        {
            SignalEvent(oChief,EventUserDefined(10));
        }
    }
}


