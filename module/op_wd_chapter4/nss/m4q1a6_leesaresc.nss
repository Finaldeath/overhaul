//::///////////////////////////////////////////////
//:: M4Q1A6_LEESARESC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets you to having rescued Leesa.
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 15, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE",1);
    SetLocalInt(GetPCSpeaker(),"NW_G_M4Q01PLOTLEESA_RESCUE",2);
}
