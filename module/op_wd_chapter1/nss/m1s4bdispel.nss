void main()
{
    object oPC = GetPCSpeaker();
    object oHenchman = GetHenchman(oPC);
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION,oPC);
    object oDom = GetAssociate(ASSOCIATE_TYPE_DOMINATED,oPC);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR,oPC);
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED,oPC);

    ActionPauseConversation();
    ActionCastSpellAtObject(SPELL_DISPEL_MAGIC,GetPCSpeaker(),METAMAGIC_ANY,TRUE);
    if(GetIsObjectValid(oHenchman))
    {
        ActionCastSpellAtObject(SPELL_DISPEL_MAGIC,oHenchman,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    }
    if(GetIsObjectValid(oAnimal))
    {
        ActionCastSpellAtObject(SPELL_DISPEL_MAGIC,oAnimal,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    }
    if(GetIsObjectValid(oDom))
    {
        ActionCastSpellAtObject(SPELL_DISPEL_MAGIC,oDom,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    }
    if(GetIsObjectValid(oFamiliar))
    {
        ActionCastSpellAtObject(SPELL_DISPEL_MAGIC,oFamiliar,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    }
    if(GetIsObjectValid(oSummon))
    {
        ActionCastSpellAtObject(SPELL_DISPEL_MAGIC,oSummon,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    }
    ActionResumeConversation();
}
