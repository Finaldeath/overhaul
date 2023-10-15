void main()
{
    if(GetIsPC(GetLastPerceived()) &&
       GetLocalInt(GetModule(), "NW_PROLOGUE_PLOT") < 99)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_CallingOut",TRUE);
    }
}

