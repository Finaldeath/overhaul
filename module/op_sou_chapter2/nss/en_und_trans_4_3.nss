//::///////////////////////////////////////////////
//:: Undrentide Transition, North to West (OnEnter)
//:: En_Und_Trans_4_3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump any player who steps past the doorway to
     the appropriate destination.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: May 5, 2003
//:://////////////////////////////////////////////

void main()
{
  object oEnterer = GetEnteringObject();
  if (GetIsPC(oEnterer) == TRUE)
  {
      object oDoor = GetObjectByTag("Undrentide_04_Undrentide_03");

      AssignCommand(oEnterer,JumpToObject(oDoor));
  }
}

