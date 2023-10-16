void main()
{
object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

    if(GetLastSpell() == SPELL_REMOVE_CURSE)
        {
        
         SpeakString("Curse Removed");
         AdjustReputation(oPC,OBJECT_SELF,50);
         ClearAllActions();
        }
}
