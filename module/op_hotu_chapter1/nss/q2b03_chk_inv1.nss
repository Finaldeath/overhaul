//::///////////////////////////////////////////////
//:: q2b03_chk_a
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks that the barrel has some of each ingrediant in it


*/
//:://////////////////////////////////////////////
//:: Created By: Keith W
//:: Created On: September 23/02
//:://////////////////////////////////////////////
int StartingConditional()
{


    if ((GetLocalInt(OBJECT_SELF,"nPartsDust") > 5) && (GetLocalInt(OBJECT_SELF,"nJugsAle") > 2))
        return FALSE;


    return TRUE;



}
