//::///////////////////////////////////////////////
//:: Manticore Enters
//:: q3_trg_manticore
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that the manticore has entered the trap area
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oMant = GetObjectByTag("q3_manticore");
    if(GetEnteringObject()==oMant)
    {
        SetLocalInt(OBJECT_SELF,"OS_MANTICORE",10);
    }
}
