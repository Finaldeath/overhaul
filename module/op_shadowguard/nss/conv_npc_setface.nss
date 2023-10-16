// Set's NPC's facing, used in conversation to keep the
// NPC from following the PC's movements

void main()
{
    AssignCommand(OBJECT_SELF, SetFacing(GetFacing(OBJECT_SELF)));
}
