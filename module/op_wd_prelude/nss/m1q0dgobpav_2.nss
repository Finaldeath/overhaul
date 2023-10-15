void main()
{
    if(GetLastPerceptionSeen())
    {
        if(GetTag(GetLastPerceived()) == "M1Q0DPavel")
        {
            ClearAllActions();
            ActionCastSpellAtObject(SPELL_MAGIC_MISSILE,GetLastPerceived(),METAMAGIC_ANY,TRUE);
        }
        else if(GetIsEnemy(GetLastPerceived()))
        {
            ActionAttack(GetLastPerceived());
        }
    }
}
