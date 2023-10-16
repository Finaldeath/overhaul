//:://////////////////////////////////////////////////
//:: xp1_mystrashand
//:: Copyright (c) 2002 Floodgate Entertainment
//:://////////////////////////////////////////////////
/*
Script for ring of teleportation for act 1.
 */
//:://////////////////////////////////////////////////
//:: Created By: Naomi Novik
//:: Created On: 10/11/2002
//:://////////////////////////////////////////////////
#include "x0_i0_common"
void CheckCrystalCount(object oPC);

void main()
{
     // Get the activator
    object oPC = GetItemActivator();

    // Get the ring
    object oRing = GetItemActivated();

    //
    AssignCommand(oPC, ClearAllActions());
    //PC must have a crystal in his possession for the ring to work.
    object oCrystal = GetItemPossessedBy(oPC, "focuscrystal");
    if (oCrystal == OBJECT_INVALID)
    {
        FloatingTextStrRefOnCreature(40391, oPC, FALSE);
    }
    else
    {

        //if this is the very first time that the ring has been
        //activated and the first cutscene has not been run (or
        //is currently running for multiplayer, I guess) - then
        //start the first cutscene - store a variable that the
        //using PC was entering the cutscene via teleportation.
        if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 0)
        {
            //If the PC tries to use the ring before he does anything else -
            if (GetLocalInt(GetModule(), "X1_Q1A2HENCHTALK") != 1)
            {
                FloatingTextStrRefOnCreature(40392, oPC, FALSE);
                //SetItemCharges(oRing, GetItemCharges(oRing) + 1);
            }
            //if this is the first PC to go downstairs - start cutscene 1 - kobold battle
            else
            {
                //Consume 1 crystal for the jump
                DestroyObject(oCrystal);

                object oDrogan = GetObjectByTag("Drogan");
                effect eEffect = EffectVisualEffect(VFX_IMP_HEALING_G);
                vector vPC = GetPosition(oPC);

                vPC = Vector(vPC.x, vPC.y, vPC.z + 1.0);
                location lPC1 = Location(GetArea(oPC), vPC, 0.0);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, GetLocation(oPC));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lPC1);
                //Mark that the ring has been used for Ayala's conversation
                SetLocalInt(oPC, "X1_Q1RINGUSED", 1);
                //Set last teleport from location
                SetLocalLocation(oPC, "lQ1TELEPORTFROM", GetLocation(oPC));
                //Set that cutscene is running
                SetLocalInt(GetModule(), "X1_CUT1RUNNING", 1);
                //Set this PC as having started the cutscene
                SetLocalInt(oPC, "nCUT1MAINPC", 1);
                //Have Drogan execute the cutscene script so that the PC doesn't get any
                //xp when the script kills some kobolds.
                DelayCommand(1.25, ExecuteScript("q1a_cut1start", oDrogan));
            }
        }
        //else if the cutscene is running - jump PC into the scene
        else if (GetLocalInt(GetModule(), "X1_CUT1RUNNING") == 1)
        {
            //Do a check to make sure main PC isn't multi-using the ring - for multiplayer
            if (GetLocalInt(oPC, "nCUT1MAINPC") != 1)
            {
                //Consume 1 crystal for the jump
                DestroyObject(oCrystal);
                //Mark that the ring has been used for Ayala's conversation
                SetLocalInt(oPC, "X1_Q1RINGUSED", 1);
                //Set last teleport from location
                SetLocalLocation(oPC, "lQ1TELEPORTFROM", GetLocation(oPC));
                ExecuteScript("q1a_cut1join", oPC);
            }
        }
        else
        {
            // If the PC is not in combat,
            // transport the player + assocs to the location

            if(!GetIsInCombat(oPC))
            {
                //SPECIAL CASE - Won't work in these area(Upper Level Crypt - High Forest hermit's house
                if (GetTag(GetArea(oPC)) == "q2_ElvenCryptUpperLevel" || GetTag(GetArea(oPC)) == "q7dhermit")
                {
                    FloatingTextStrRefOnCreature(40393, oPC, FALSE);

                }
                else
                {

                    //SPECIAL CASE - if you use the ring while a hostage in the Bubbling Cauldron
                    //Destroy the barricade and all the kobolds
                    if (GetLocalInt(GetModule(), "X1_Q1DPCHOSTAGE") == 1)
                    {
                        object oShaman = GetObjectByTag("q1dk_shaman");
                        object oKobold1 = GetObjectByTag("q1dk_footpad1");
                        object oKobold2 = GetObjectByTag("q1dk_footpad2");
                        object oKobold3 = GetObjectByTag("q1dk_footpad3");
                        object oKobold4 = GetObjectByTag("q1dk_footpad4");
                        object oBarricade = GetObjectByTag("q1dbaricade_7");
                        //effects
                        effect eDamage = EffectDamage(500);

                        //variables
                        SetLocalInt(oPC, "Lodar_Job", 6);
                        SetLocalInt(GetModule(), "Captive_Cook", 3);

                        //Destroy kobolds..
                        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oShaman));
                        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oKobold1));
                        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oKobold2));
                        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oKobold3));
                        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oKobold4));
                        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oBarricade));
                    }
                    //Special case

                    //Consume 1 crystal for the jump
                    DestroyObject(oCrystal);
                    //check to see if this was the last Crystal that the PC had
                    DelayCommand(0.2, CheckCrystalCount(oPC));

                    //location to teleport to
                    location lTport = GetLocation(GetWaypointByTag("X1_TPORT_LOC"));
                    //teleport effect
                    effect ePoof = EffectVisualEffect(VFX_IMP_HEALING_G);

                    //PC's current location
                    vector vUser = GetPosition(oPC);
                    vUser = Vector(vUser.x, vUser.y, vUser.z + 1.0);
                    location lUser1 = Location(GetArea(oPC), vUser, 0.0);
                    //Store current location so that Ayala can teleport PC back there if requested.
                    SetLocalLocation(oPC, "lQ1TELEPORTFROM", GetLocation(oPC));
                    SetLocalInt(oPC, "X1_Q1RINGUSED", 1);

                    //Target location
                    vector vTarget = GetPosition(GetWaypointByTag("X1_TPORT_LOC"));
                    vTarget = Vector(vTarget.x, vTarget.y, vTarget.z + 1.0);
                    location lTarget1 = Location(GetArea(GetWaypointByTag("X1_TPORT_LOC")), vTarget, 0.0);

                    //Apply teleport effect at current location
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, GetLocation(oPC));
                    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lUser1);

                    //Apply teleport effect at target location
                    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTport));
                    DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTarget1));
                    //Do single player autosave on arrival
                    DelayCommand(2.0, DoSinglePlayerAutoSave());
                    // Teleport back to Drogan's house
                    DelayCommand(0.5, AssignCommand(oPC, ActionJumpToLocation(lTport)));

                }
            }
            else
            {
                FloatingTextStrRefOnCreature(40394, oPC, FALSE);
            }

        }
    }

}
void CheckCrystalCount(object oPC)
{
    object oCrystal = GetItemPossessedBy(oPC, "focuscrystal");
    if (GetIsObjectValid(oCrystal) == FALSE)
        FloatingTextStrRefOnCreature(40395, oPC, FALSE);
}
