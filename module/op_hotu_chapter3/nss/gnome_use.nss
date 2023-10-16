///////////////////////////////////////////////////////////////////////////////////
// This is the OnUse script for the gnomish goblin machine. Each time it is used it
// will turn the machine on or off.
//
// Created by: Brad Prince
// 9-13-02
//
///////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oPC = GetLastUsedBy();
   int iOn = GetLocalInt(OBJECT_SELF, "on");
   object oSound = GetNearestObjectByTag("gnome_contrap", OBJECT_SELF);

   if(iOn == 0) {
      SetLocalInt(OBJECT_SELF, "on", 1);
      AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.0));
      DelayCommand(2.0, SetLocalInt(OBJECT_SELF, "start", 1));
      DelayCommand(2.2, SoundObjectPlay(oSound));
   }
   else {
      SetLocalInt(OBJECT_SELF, "on", 0);
      AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_MID, 1.0, 2.0));
      DelayCommand(2.0, SetLocalInt(OBJECT_SELF, "start", 0));
      DelayCommand(2.2, SoundObjectStop(oSound));
   }
}
