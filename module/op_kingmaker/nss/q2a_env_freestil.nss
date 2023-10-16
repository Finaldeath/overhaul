//::///////////////////////////////////////////////
//:: Free Stiletto
//:: q2a_env_freestil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Enivid sets Stiletto free.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oStiletto = GetObjectByTag("q2_stiletto");
    SetLocalInt(OBJECT_SELF,"OS_ENIVID_STILETTO",20);
    SetLocalInt(OBJECT_SELF,"OS_ENIVID_FREE",10);

    object oGone = GetObjectByTag("q2_factguy");

    //SetCommandable(FALSE, oStiletto);
    AssignCommand(oStiletto, JumpToObject(oGone,FALSE));
    //DestroyObject(oStiletto);
}
