void main()
{
    if(GetIsPC(GetEnteringObject()))
    {
        object oLizard = GetNearestObjectByTag("M3Q2G12LizWiz2");
        object oSlave = GetNearestObjectByTag("M3Q2G10DieSlave");
        AssignCommand(oLizard, ClearAllActions());
        AssignCommand(oLizard,ActionCastSpellAtObject(SPELL_MELFS_ACID_ARROW,oSlave, METAMAGIC_ANY, TRUE));
    }
}
