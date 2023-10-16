//::///////////////////////////////////////////////
//:: Name x2_def_onconv
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default On Conversation script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

void main()
{
    if(GetLocalInt(OBJECT_SELF, "CAN_TALK") == 0)
    {
        if(GetListenPatternNumber() == -1)
            SpeakStringByStrRef(84092);
        return;
    }
    ClearAllActions(TRUE);
    ExecuteScript("nw_c2_default4", OBJECT_SELF);
}
