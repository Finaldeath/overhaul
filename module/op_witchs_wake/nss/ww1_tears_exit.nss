////////////////////////////////////////////////////////////
// Witch's Wake 1: Tears exit
// ww1_tears_exit.nss
// Copyright (c) 2001 Bioware Corp.
////////////////////////////////////////////////////////////
/*
    Remove any potential polymorph as it may break the
    upcoming cutscene.
*/
////////////////////////////////////////////////////////////

void main()
{
    //Standard familiar prevention script
    object oClicker = GetClickingObject();
    if (GetIsPossessedFamiliar(oClicker) == TRUE)
    {
        string sMessage = "You dare not stray far from your master.";
        FloatingTextStringOnCreature(sMessage, oClicker);
    }
    else if (GetIsPC(oClicker) || GetIsPC(GetMaster(oClicker)) == TRUE)
    {
        //Remove all effects on the player.
        effect eEffect = GetFirstEffect(oClicker);
        int iEffectType;
        while (GetIsEffectValid(eEffect) == TRUE)
        {
            RemoveEffect(oClicker, eEffect);

            //Update the loop variable
            eEffect = GetNextEffect(oClicker);
        }

        //Make transition
        object oTarget = GetTransitionTarget(OBJECT_SELF);
        SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);
        AssignCommand(oClicker,JumpToObject(oTarget));
    }


 /* else
  This turned out to be unnecessary since GetIsPC returns true
  if a player controlled, which includes familiars.
  // * This is an NPC attempting to cross the transition
  // * Clear all actions on it (to prevent system
  // * resource eating by a creature trying to cross
  // * an area transition that it can't
  {
    AssignCommand(oClicker, ClearAllActions());
  }
  */
}
