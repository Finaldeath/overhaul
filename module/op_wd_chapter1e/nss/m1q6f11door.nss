void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_StartDesther") == FALSE)
    {
        int nIdx;
        //SetLocalInt(GetModule(),"NW_G_M1Q6F11RitualStart",TRUE);
        //SignalEvent(GetNearestObjectByTag("Destherm1q6"),EventUserDefined(680));
        for(nIdx = 1;nIdx <= 5;nIdx++)
        {
            SignalEvent(GetNearestObjectByTag("Ritual_Zombie" + IntToString(nIdx)),EventUserDefined(680));
        }
        //SetLocalInt(OBJECT_SELF,"NW_L_StartDesther",TRUE);
        //DelayCommand(30.0f, SetLocalInt(OBJECT_SELF,"NW_L_StartDesther",FALSE));
        SignalEvent(GetNearestObjectByTag("Destherm1q6"),EventUserDefined(699));
    }
}
