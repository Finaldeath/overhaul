//::///////////////////////////////////////////////
//:: Name: q2a1_setfollow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Set variable to make pre guards follow the
        PC...
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF, "nFollow", 1);
    SetLocalString(OBJECT_SELF, "szFollow", GetName(GetPCSpeaker()));
}
