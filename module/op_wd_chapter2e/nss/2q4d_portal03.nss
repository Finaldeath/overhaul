void main()
{
    object oItem = GetItemPossessedBy(GetPCSpeaker(),"2Q4_PlanarToken");
    SetLocalInt(OBJECT_SELF, "PORTAL_DESTROYED", 1);
    DestroyObject(oItem);
    // add effect for the portal
}
