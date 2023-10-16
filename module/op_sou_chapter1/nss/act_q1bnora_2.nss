//Get rid of the baby if the PC is trying an exploit
void main()
{
    object oBaby = GetObjectByTag("q1hbaby");
    if (oBaby != OBJECT_INVALID)
        DestroyObject(oBaby);
    //else
        //SendMessageToPC(GetFirstPC(), "Debug - Invalid Baby");
}
