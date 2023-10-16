// * Succcubus is freed from the force cage
#include "nw_i0_generic"

void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_G_SUCCUBUS_FREE")==1)
    {
    //* give potion to succubus
        object oPotion = GetItemPossessedBy(GetPCSpeaker(), "M3Q3D_SUCCUBUS");
        if (GetIsObjectValid(oPotion) == TRUE)
        {

            ActionPauseConversation();
            DestroyObject(oPotion);
    //        SpeakString("Here is your potion.");
    //        AssignCommand(GetPCSpeaker(),ActionGiveItem(oPotion,OBJECT_SELF));
            ActionResumeConversation();
        }
        SetPlotFlag(OBJECT_SELF, FALSE);
      // * destroy the cage
      int i =  1;

      object oBit = GetNearestObjectByTag("M3Node", OBJECT_SELF, i);
      while (GetIsObjectValid(oBit) == TRUE)
      {
        i++;
        DestroyObject(oBit);
        oBit = GetNearestObjectByTag("M3Node", OBJECT_SELF, i);
      }
      //* cover up effect
      effect eVis = EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL);
      ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, OBJECT_SELF);

      SetIsTemporaryEnemy(GetPCSpeaker());
      DetermineCombatRound();
  }
}
