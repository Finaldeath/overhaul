//::///////////////////////////////////////////////
//:: Name q4a_hb_lights
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script is just to test what effects are
     on the mine lights.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 7, 2003
//:://////////////////////////////////////////////
int CheckEffects(object oObject);
void main()
{
   //SpeakString("[NOT IN STRING EDITOR] This object has " + IntToString(CheckEffects(OBJECT_SELF)) + " effect on it.");
}

int CheckEffects(object oObject) {
   int iCount = 0;
   effect eEff = GetFirstEffect(oObject);
   while(GetIsEffectValid(eEff)) {
      iCount = iCount + 1;
      eEff = GetNextEffect(oObject);
   }
   return iCount;
}
