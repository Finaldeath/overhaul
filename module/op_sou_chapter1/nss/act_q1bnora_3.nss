//Store baby as object on Nora so it can be destroyed...
void main()
{
    object oPC = GetPCSpeaker();
    object oBaby = GetItemPossessedBy(oPC, "q1hbaby");
    SetLocalObject(OBJECT_SELF, "oBaby", oBaby);

}
