int StartingConditional()
{
    //if Oleff has been pissed off
    if (GetLocalInt(OBJECT_SELF,"NW_L_M1Q1A01Angry") == TRUE)
    {
        return TRUE;
    }
    //if the letter was given, but not to this person, and Giles has all items
    else if (GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_M1S1LetterGiven")) &&
             GetLocalObject(OBJECT_SELF,"NW_L_M1S1LetterGiven") != GetPCSpeaker() &&
             GetLocalInt(GetModule(),"nw_g_m1q1_Giles") == 40)
    {
        return TRUE;
    }
     //if the letter was given, but not to this person, and Giles has some items
     //but all are accounted for
    else if (GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_M1S1LetterGiven")) &&
             GetLocalObject(OBJECT_SELF,"NW_L_M1S1LetterGiven") != GetPCSpeaker() &&
             GetLocalInt(GetModule(),"nw_g_m1q1_Giles") == 50)
    {
        return TRUE;
    }
    else
    {
        return FALSE;
    }
}

