// cage destroyed:
// removed the flag from the NPC that destroyed it that told the NPC to attack

void main()
{
    object oKiller = GetLastKiller();
    SetLocalObject(oKiller, "Q6F_BLOCKER", OBJECT_INVALID);
}
