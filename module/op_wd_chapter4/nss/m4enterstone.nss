//* Enters the sourcestone
////////////////////////////////////////////////////////////
// OnClick/OnAreaTransitionClick
// NW_G0_Transition.nss
// Copyright (c) 2001 Bioware Corp.
////////////////////////////////////////////////////////////
// Created By: Sydney Tang
// Created On: 2001-10-26
// Description: This is the default script that is called
//              if no OnClick script is specified for an
//              Area Transition Trigger or
//              if no OnAreaTransitionClick script is
//              specified for a Door that has a LinkedTo
//              Destination Type other than None.
////////////////////////////////////////////////////////////

void main()
{
  object oClicker = GetClickingObject();
  object oTarget = GetObjectByTag("M4C06_C04");

    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2);
    object oPC = GetPCSpeaker();
    location lPC = GetLocation(oPC);
    ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eVis, lPC);

  SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
//  AddJournalQuestEntry("4Q01_MAIN",40,oClicker,FALSE);
  DelayCommand(1.0,AssignCommand(oClicker,JumpToObject(oTarget)));

}


