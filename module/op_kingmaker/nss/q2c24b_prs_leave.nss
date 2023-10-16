//::///////////////////////////////////////////////
//:: Prisoner Leaves
//:: q2c24b_prs_leave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Prisoner leaves the area
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("q2ac24c_at_q2ac24a");
    effect eGhost = EffectCutsceneGhost();

    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGhost, OBJECT_SELF, 10.0f);
    SetLocalInt(OBJECT_SELF,"OS_PRISONER_FREE",TRUE);
    ActionMoveToObject(oDoor, TRUE);

    // This used to be a DO_COMMAND but there was a
    // problem with them not destroying themselves so now its forced.
    DelayCommand(5.0f, DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
