//q2_ooc_votelever
//starts the election vote
void main()
{
    object oPC = GetLastUsedBy();
    object oAlias = GetObjectByTag("q2_alias");
    object oBeck = GetObjectByTag("q2_sirbecket");
    object oWay = GetObjectByTag("q2c25_way_beccas");
    object oWay1 = GetObjectByTag("q2c25_way_alias");
    object oWay2 = GetObjectByTag("q2_way_pcvote");

    AssignCommand(oBeck,ActionJumpToObject(oWay));
    AssignCommand(oAlias,ActionJumpToObject(oWay1));
    AssignCommand(oPC,ActionJumpToObject(oWay2));

    SetLocalInt(oPC,"OS_START_VOTE",10);
}
