//::///////////////////////////////////////////////
//:: Manticore Leaves
//:: q3_trg_mantiexit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that the manticore has exited the trap area
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oMant = GetObjectByTag("q3_manticore");
    if(GetExitingObject()==oMant)
    {
        SetLocalInt(OBJECT_SELF,"OS_MANTICORE",0);
    }
}
