//::///////////////////////////////////////////////
//:: Name: q1a2_endcon_hench
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    this is where the cut-scene will begin:

- sound of battle coming from the east (the stairwell)
- Dorna walks a short step towards it and says "Do you hear that?"
- Mischa: "The sounds of battle! From downstairs!"
- Xanos: "Master Drogan is in trouble! Use your rings!"
- Then each of them will disappear using the ring's teleportation effect.

If the player uses his own ring or uses the stairwell to go down,
the major cutscene of Drogan's battle with the kobolds should begin.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 31/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(), "X1_Q1A2HENCHEND") != 1)
    {
        SetLocalInt(GetModule(), "X1_Q1A2HENCHEND", 1);
        object oPC = GetPCSpeaker();

        SetLocalInt(GetModule(), "X1_Q1A2HENCHTALK", 1);

        object oXanos = GetObjectByTag("x0_hen_xan_up");
        object oMischa = GetObjectByTag("x0_hen_mis_up");
        object oDorna = GetObjectByTag("x0_hen_dor_up");
        object oDoor = GetObjectByTag("q1a2doortop");

        //Set Conversation variables
        SetLocalInt(oXanos, "Xanos_Spoke", 1);
        SetLocalInt(oMischa, "Xanos_Spoke", 1);
        SetLocalInt(oDorna, "Xanos_Spoke", 1);

        //Sounds of Battle
        string szBattle1 = "c_kobold_bat1";
        string szBattle2 = "c_kobold_bat2";
        string szBattle3 = "c_koboldchf_bat1";
        AssignCommand(oPC, PlaySound(szBattle1));
        DelayCommand(1.0, AssignCommand(oPC, PlaySound(szBattle1)));
        DelayCommand(2.3, AssignCommand(oPC, PlaySound(szBattle2)));
        DelayCommand(2.5, AssignCommand(oPC, PlaySound(szBattle1)));
        DelayCommand(4.5, AssignCommand(oPC, PlaySound(szBattle3)));
        DelayCommand(5.0, AssignCommand(oPC, PlaySound(szBattle2)));

        //Dorna walks a short step towards it and says "Do you hear that?"
        AssignCommand(oDorna, ActionMoveToObject(oDoor, FALSE));
        AssignCommand(oDorna, SpeakStringByStrRef(40378));
        AssignCommand(oDorna, PlaySoundByStrRef(75985, FALSE));
        DelayCommand(0.75, AssignCommand(oDorna, ClearAllActions()));

        //Mischa: "The sounds of battle! From downstairs!"
        DelayCommand(1.0, AssignCommand(oMischa, SetFacingPoint(GetPosition(oDoor))));
        DelayCommand(1.75, AssignCommand(oMischa, SpeakStringByStrRef(40379)));
        DelayCommand(1.75, AssignCommand(oMischa, PlaySoundByStrRef(76049)));
        //Xanos: "Master Drogan is in trouble! Use your rings!"
        DelayCommand(1.5, AssignCommand(oXanos, SetFacingPoint(GetPosition(oDoor))));
        DelayCommand(3.25, AssignCommand(oXanos, SpeakStringByStrRef(40380)));
        DelayCommand(3.25, AssignCommand(oXanos, PlaySoundByStrRef(76050)));
        //teleportation effect
        effect eEffect = EffectVisualEffect(VFX_IMP_HEALING_G);
        vector vXanos = GetPosition(oXanos);
        vector vMischa = GetPosition(oMischa);
        vector vDorna = GetPosition(oDorna);
        vXanos = Vector(vXanos.x, vXanos.y, vXanos.z + 1.5);
        location lXanos1 = Location(GetArea(oXanos), vXanos, 0.0);
        vMischa = Vector(vMischa.x, vMischa.y, vMischa.z + 1.5);
        location lMischa1 = Location(GetArea(oMischa), vMischa, 0.0);
        vDorna = Vector(vDorna.x, vDorna.y, vDorna.z + 1.5);
        location lDorna1 = Location(GetArea(oDorna), vDorna, 0.0);

        DelayCommand(4.0, AssignCommand(oXanos, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 2.0)));
        DelayCommand(4.5, AssignCommand(oMischa, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 2.0)));
        DelayCommand(4.75, AssignCommand(oDorna, ActionPlayAnimation(ANIMATION_LOOPING_CONJURE1, 1.0, 2.0)));

        DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, GetLocation(oXanos)));
        DelayCommand(5.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lXanos1));

        DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, GetLocation(oMischa)));
        DelayCommand(5.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lMischa1));

        DelayCommand(5.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, GetLocation(oDorna)));
        DelayCommand(5.75, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eEffect, lDorna1));

        DestroyObject(oXanos, 6.0);
        DestroyObject(oMischa, 6.5);
        DestroyObject(oDorna, 6.75);

        MusicBackgroundStop(GetArea(OBJECT_SELF));


        SetLocked(oDoor, FALSE);
        //Set the downstairs trigger as ready for the cutscene
        object oTrigger = GetObjectByTag("q1a1_entstart_cut1");
        SetLocalInt(oTrigger, "nCutSceneReady", 1);
    }
}
