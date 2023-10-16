//::///////////////////////////////////////////////
//:: Portable Door (OnActivateItem)
//:: PortableDoor.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle the portable door.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 1, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetItemActivator();
    object oArea = GetArea(oPC);
    string sArea = GetTag(oArea);
    object oItem = GetItemActivated();
    object oTarget = GetItemActivatedTarget();
    location lTarget = GetItemActivatedTargetLocation();
    object oNearestDoor = GetNearestObjectToLocation(OBJECT_TYPE_DOOR, lTarget);
    location lNearestDoor = GetLocation(oNearestDoor);
    float fDistance = GetDistanceBetweenLocations(lTarget, lNearestDoor);

    //Prevent people from spawning it in the Lair of the Shadow Lich, the End
    //Battle, in Combat, too close to a doorway, or behind a transition poly.
    if (sArea == "Wizard_05" ||
        sArea == "Temple_04" ||
        GetIsInCombat(oPC) == TRUE ||
        oTarget != OBJECT_INVALID ||
        (oNearestDoor != OBJECT_INVALID &&
         fDistance < 5.0))
    {
        //Send error message
        FloatingTextStrRefOnCreature(40540, oPC, FALSE);
/*DEBUG*///FloatingTextStringOnCreature("DEBUG: That is an unsuitable location for your portable door.", oPC, FALSE);
    }
    else
    {
        //Destroy any previous version of the door that may still exist.
        object oPreviousDoor = GetObjectByTag("PL_PortableDoor");
        DestroyObject(oPreviousDoor);

        //Create door placeable.
        object oDoor = CreateObject(OBJECT_TYPE_PLACEABLE, "pl_portabledoor", lTarget);

        //Apply shadow VFX
        effect eVFX = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oDoor);

        //Save out its location for future reference
        SetLocalLocation(GetModule(), "lPortableDoor", lTarget);

        //Add journal entry
        int bDoOnce = GetLocalInt(GetModule(), "bDoOnce_Journ_Wizard_60");
        if (bDoOnce == FALSE)
        {
            //AddJournalQuestEntry("Journ_Wizard_60", 1, oPC, TRUE, TRUE);
            SetLocalInt(GetModule(), "bDoOnce_Journ_Wizard_60", TRUE);
        }
    }
}
