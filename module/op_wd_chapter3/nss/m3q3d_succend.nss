// * Succcubus is freed from the force cage
#include "nw_i0_generic"

void main()
{
//    SpeakString("Abort");
    if(GetLocalInt(OBJECT_SELF,"NW_G_SUCCUBUS_FREE")==1)
    {
    //* give potion to succubus
//        SpeakString("Fight!");
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC);
        object oPotion = GetItemPossessedBy(oPC, "M3Q3D_SUCCUBUS");
        if (GetIsObjectValid(oPotion) == TRUE)
        {
            DestroyObject(oPotion);
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

      SetIsTemporaryEnemy(oPC);
      DetermineCombatRound();
  }
}

