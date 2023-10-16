//::///////////////////////////////////////////////
//:: Name q1a3_ud_force
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Force trigger's user defined.
    When a pc enters the trigger in Drogan's lab,
    he should be pushed out again - even if he
    keeps clicking and trying to get through the
    trigger
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Feb 18/03
//:://////////////////////////////////////////////

void JumpPC(object oPC);
void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 1100)
    {
        object oTeleport = GetWaypointByTag("wp_lab_forcefield");
        //Get the first creature currently on the telepad
        object oPC = GetFirstInPersistentObject();
        //if you are not Riisi - you get bounced...(or a willowisp...)
        while (oPC != OBJECT_INVALID)
        {
            if (GetTag(oPC) != "Riisi" && GetTag(oPC) != "q1a3will1" && GetTag(oPC) != "q1a3will2")
            {
                //Clear the PC's actions
                AssignCommand(oPC, ClearAllActions());


                //ApplyEffectToPC
                effect eTeleport = EffectVisualEffect(VFX_IMP_HEALING_G);
                vector vPC = GetPosition(oPC);
                vPC = Vector(vPC.x, vPC.y, vPC.z + 1.5);
                location lPC1 = Location(GetArea(oPC), vPC, 0.0);
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, GetLocation(oPC));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, lPC1);

                //ApplyEffectToPattern
                object oPattern = GetObjectByTag("q1a3design1");
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), GetLocation(oPattern));

                //ApplyEffectToRuneStones
                object oStone1 = GetObjectByTag("q1a3stone1");
                object oStone2 = GetObjectByTag("q1a3stone2");
                object oStone3 = GetObjectByTag("q1a3stone3");
                object oStone4 = GetObjectByTag("q1a3stone4");
                object oStone5 = GetObjectByTag("q1a3stone5");
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_AC_BONUS), GetLocation(oStone1));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_AC_BONUS), GetLocation(oStone2));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_AC_BONUS), GetLocation(oStone3));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_AC_BONUS), GetLocation(oStone4));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_AC_BONUS), GetLocation(oStone5));

                //Jump PC to stairwell
                DelayCommand(0.1, JumpPC(oPC));
                //Stun PC
                DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oPC, 2.5));
                //Apply Effect to Telepad
                vector vTelepad = GetPosition(oTeleport);
                vTelepad = Vector(vTelepad.x, vTelepad.y, vTelepad.z + 1.5);
                location lTelepad1 = Location(GetArea(oPC), vTelepad, 0.0);
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, GetLocation(oTeleport)));
                DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eTeleport, lTelepad1));


                DelayCommand(0.6, SignalEvent(OBJECT_SELF, EventUserDefined(1100)));
            }
            oPC = GetNextInPersistentObject();
        }

    }
}

void JumpPC(object oPC)
{
    object oDestination = GetWaypointByTag("wp_lab_forcefield");
    //SetCommandable(TRUE, oPC);
    AssignCommand(oPC, JumpToObject(oDestination));
    //SetCommandable(FALSE, oPC);
}

