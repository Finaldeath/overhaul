void main()
{
    object oRested = GetLastPCRested();
    if (GetIsPC(oRested) &&
        GetLastRestEventType() == REST_EVENTTYPE_REST_FINISHED &&
        GetLocalInt(GetObjectByTag("M1Q0ABim"),"NW_L_TALKLEVEL") >= 4)
    {
        SetLocalInt(oRested,"NW_L_M1Q0Rested",TRUE);
    }

}
