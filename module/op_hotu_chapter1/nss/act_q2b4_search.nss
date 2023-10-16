//::///////////////////////////////////////////////
//:: Name   act_q2b4_search
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Perform a search check on the throne (DC20).
    Success means that the lever to control the
    teleport to the vampire lair has been found.
    PCs that fail should not be able to try again
    for one game day.
*/
//:://////////////////////////////////////////////
//:: Created By:    Keith Warner
//:: Created On:    Dec 10/02
//:://////////////////////////////////////////////

void main()
{
    //Search Check  DC 20  -
    if (GetIsSkillSuccessful(GetPCSpeaker(), SKILL_SEARCH, 20))
    {
        // Set Success Variable
        SetLocalInt(GetModule(),"nQ2B4ThroneFound",1);
    }
    else
    {
    // Failure - don't let them re-search the throne until tomorrow - so save current day
        SetLocalInt(GetPCSpeaker(),"nQ2B4SearchThrone",GetCalendarDay());

    }
}
