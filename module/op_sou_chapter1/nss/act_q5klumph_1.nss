//take rod from the PC and give it to Klumph
void main()
{

    object oItem = GetLocalObject(OBJECT_SELF, "oRod");
        DestroyObject(oItem);
    CreateItemOnObject("q5rodofruler", OBJECT_SELF);

}
