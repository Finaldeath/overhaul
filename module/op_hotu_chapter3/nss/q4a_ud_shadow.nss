//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName q4a_ud_shadow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will have the dying shadow check
     to see if any other shadows are still alive.
     If not, it will set an int on Veregon so that
     he can be damaged. (He can only be hurt if
     there are no shadows left alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 7, 2003
//:://////////////////////////////////////////////
void RemoveEffects(object oObject);

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {

    }
    else if(nUser == 1002) // PERCEIVE
    {

    }
    else if(nUser == 1003) // END OF COMBAT
    {

    }
    else if(nUser == 1004) // ON DIALOGUE
    {

    }
    else if(nUser == 1005) // ATTACKED
    {

    }
    else if(nUser == 1006) // DAMAGED
    {

    }
    else if(nUser == 1007) // DEATH
    {
       object oShadow = GetFirstObjectInArea(GetArea(OBJECT_SELF));
       // The boss, Veregon.
       object oVeregon = GetObjectByTag("q4a_veregon");
       // Reset the counter.
       int iCount = 0;

       // Look for any remaining shadows.  If there are, bump the counter.
       while(oShadow != OBJECT_INVALID) {
          if(GetTag(oShadow) == "q4a_shadow" && oShadow != OBJECT_SELF)
             iCount = iCount + 1;
          oShadow = GetNextObjectInArea(GetArea(OBJECT_SELF));
       }
       // Check the final tally. If there are no shadows left, set
       // Veregon so that he can be hurt.
       if(iCount == 0) {
          RemoveEffects(oVeregon);
          SetPlotFlag(oVeregon, 0);
          DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), oVeregon));
          DelayCommand(0.4, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oVeregon, 5.0));
       }
    }
    else if(nUser == 1008) // DISTURBED
    {

    }

}

void RemoveEffects(object oObject) {
   effect eEff = GetFirstEffect(oObject);
   while(GetIsEffectValid(eEff)) {
      RemoveEffect(oObject, eEff);
      eEff = GetNextEffect(oObject);
   }
}
