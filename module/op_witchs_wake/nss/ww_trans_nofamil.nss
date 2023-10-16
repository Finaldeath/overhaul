//::///////////////////////////////////////////////
//:: Witch's Wake: Restrict Possessed Familiars (Area Transition)
//:: WW_Trans_NoFamil.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Prevents possessed familiars from invoking
     area transitions.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 25, 2004
//:://////////////////////////////////////////////

void main()
{
    object oClicker = GetClickingObject();
    if (GetIsPossessedFamiliar(oClicker) == TRUE)
    {
        string sMessage = "You dare not stray far from your master.";
        FloatingTextStringOnCreature(sMessage, oClicker);
    }
    else
    {
        object oTarget = GetTransitionTarget(OBJECT_SELF);
        SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
        AssignCommand(oClicker,JumpToObject(oTarget));
    }
}
