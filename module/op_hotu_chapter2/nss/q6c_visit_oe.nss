// when the player passess this trigger - this area is flagged as visited,
// so when the player returns, the medusa would be dead and the shard missing.

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "VISITED", 1);
}
