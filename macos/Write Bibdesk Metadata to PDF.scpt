FasdUAS 1.101.10   ��   ��    k             l      ��  ��    � �
  This script copies the BibDesk metadata fields of Author, Title, Keywords into the attached PDF(s).

  Make sure you set the location of your pdfmeta right right under this comment!
     � 	 	r 
     T h i s   s c r i p t   c o p i e s   t h e   B i b D e s k   m e t a d a t a   f i e l d s   o f   A u t h o r ,   T i t l e ,   K e y w o r d s   i n t o   t h e   a t t a c h e d   P D F ( s ) . 
 
     M a k e   s u r e   y o u   s e t   t h e   l o c a t i o n   o f   y o u r   p d f m e t a   r i g h t   r i g h t   u n d e r   t h i s   c o m m e n t ! 
   
  
 l     ��������  ��  ��        j     �� �� 
0 worker    m        �   � / p g m / s c r i p t s / p d f m e t a   " # # # A U T H O R # # # "   " # # # T I T L E # # # "   " # # # K E Y W O R D S # # # "   " # # # S O U R C E # # # "      l     ��������  ��  ��        i        I     �� ��
�� .aevtoappnull  �   � ****  J      ����  ��    k    K       r         m        �      o      ���� 0 message         l   ��������  ��  ��      !�� ! O   K " # " k   J $ $  % & % I   ������
�� .miscactvnull��� ��� null��  ��   &  ' ( ' r     ) * ) l    +���� + n     , - , 1    ��
�� 
sele - 4    �� .
�� 
docu . m    ���� ��  ��   * o      ���� 0 thebooks theBooks (  / 0 / X   4 1�� 2 1 k   '/ 3 3  4 5 4 O   '- 6 7 6 k   +, 8 8  9 : 9 l  + +��������  ��  ��   :  ; < ; l   + +�� = >��   = * $ Get the Title and replace specials     > � ? ? H   G e t   t h e   T i t l e   a n d   r e p l a c e   s p e c i a l s   <  @ A @ r   + 3 B C B n   + 1 D E D 1   / 1��
�� 
fldv E 4   + /�� F
�� 
bfld F m   - . G G � H H 
 T i t l e C o      ���� 0 thetitle theTitle A  I J I r   4 > K L K n  4 < M N M I   5 <�� O���� "0 replaceinstring ReplaceInString O  P Q P o   5 6���� 0 thetitle theTitle Q  R S R m   6 7 T T � U U  { S  V�� V m   7 8 W W � X X  ��  ��   N  f   4 5 L o      ���� 0 thetitle theTitle J  Y Z Y r   ? M [ \ [ n  ? K ] ^ ] I   @ K�� _���� "0 replaceinstring ReplaceInString _  ` a ` o   @ A���� 0 thetitle theTitle a  b c b m   A D d d � e e  } c  f�� f m   D G g g � h h  ��  ��   ^  f   ? @ \ o      ���� 0 thetitle theTitle Z  i j i r   N \ k l k n  N Z m n m I   O Z�� o���� "0 replaceinstring ReplaceInString o  p q p o   O P���� 0 thetitle theTitle q  r s r m   P S t t � u u  ' s  v�� v m   S V w w � x x  \ '��  ��   n  f   N O l o      ���� 0 thetitle theTitle j  y z y r   ] k { | { n  ] i } ~ } I   ^ i�� ���� "0 replaceinstring ReplaceInString   � � � o   ^ _���� 0 thetitle theTitle �  � � � m   _ b � � � � �  - - - �  ��� � m   b e � � � � �    -  ��  ��   ~  f   ] ^ | o      ���� 0 thetitle theTitle z  � � � r   l z � � � n  l x � � � I   m x�� ����� "0 replaceinstring ReplaceInString �  � � � o   m n���� 0 thetitle theTitle �  � � � m   n q � � � � �  - - �  ��� � m   q t � � � � �    -  ��  ��   �  f   l m � o      ���� 0 thetitle theTitle �  � � � r   { � � � � n  { � � � � I   | ��� ����� "0 replaceinstring ReplaceInString �  � � � o   | }���� 0 thetitle theTitle �  � � � m   } � � � � � �  \ �  ��� � m   � � � � � � �  ��  ��   �  f   { | � o      ���� 0 thetitle theTitle �  � � � l  � ���������  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � [ U display dialog "Title: " & theTitle buttons ("�") default button 1 giving up after 3    � � � � �   d i s p l a y   d i a l o g   " T i t l e :   "   &   t h e T i t l e   b u t t o n s   ( " " " )   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   3 �  � � � l  � ���������  ��  ��   �  � � � l   � ��� � ���   � + % Get the Author and replace specials     � � � � J   G e t   t h e   A u t h o r   a n d   r e p l a c e   s p e c i a l s   �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
fldv � 4   � ��� �
�� 
bfld � m   � � � � � � �  A u t h o r � o      ���� 0 	theauthor 	theAuthor �  � � � r   � � � � � n  � � � � � I   � ��� ����� "0 replaceinstring ReplaceInString �  � � � o   � ����� 0 	theauthor 	theAuthor �  � � � m   � � � � � � � 
   a n d   �  ��� � m   � � � � � � �  ,  ��  ��   �  f   � � � o      ���� 0 	theauthor 	theAuthor �  � � � r   � � � � � n  � � � � � I   � ��� ����� "0 replaceinstring ReplaceInString �  � � � o   � ����� 0 	theauthor 	theAuthor �  � � � m   � � � � � � �  { �  ��� � m   � � � � � � �  ��  ��   �  f   � � � o      ���� 0 	theauthor 	theAuthor �  � � � r   � � � � � n  � � � � � I   � ��� ����� "0 replaceinstring ReplaceInString �  � � � o   � ����� 0 	theauthor 	theAuthor �  � � � m   � � � � � � �  } �  ��� � m   � � � � � � �  ��  ��   �  f   � � � o      ���� 0 	theauthor 	theAuthor �  � � � r   � � � � � n  � � � � � I   � ��� ����� "0 replaceinstring ReplaceInString �  � � � o   � ����� 0 	theauthor 	theAuthor �  � � � m   � � � � � � �  \ �  ��� � m   � �   �  ��  ��   �  f   � � � o      ���� 0 	theauthor 	theAuthor �  r   � � n  � � I   � ������� "0 replaceinstring ReplaceInString 	
	 o   � ����� 0 	theauthor 	theAuthor
  m   � � �  ' �� m   � � �  \ '��  ��    f   � � o      ���� 0 	theauthor 	theAuthor  l  � ���������  ��  ��    l  � �����   ] W display dialog "Author: " & theAuthor buttons {"�"} default button 1 giving up after 3    � �   d i s p l a y   d i a l o g   " A u t h o r :   "   &   t h e A u t h o r   b u t t o n s   { " " " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   3  l  � ���������  ��  ��    l   � �����   - ' Get the Keywords and replace specials     � N   G e t   t h e   K e y w o r d s   a n d   r e p l a c e   s p e c i a l s    !  r   �"#" n   � �$%$ 1   � ���
�� 
fldv% 4   � ���&
�� 
bfld& m   � �'' �((  K e y w o r d s# o      ���� 0 thekeywords theKeywords! )*) r  +,+ n -.- I  ��/���� "0 replaceinstring ReplaceInString/ 010 o  ���� 0 thekeywords theKeywords1 232 m  
44 �55  {3 6��6 m  
77 �88  ��  ��  .  f  , o      ���� 0 thekeywords theKeywords* 9:9 r  (;<; n $=>= I  $��?���� "0 replaceinstring ReplaceInString? @A@ o  ���� 0 thekeywords theKeywordsA BCB m  DD �EE  }C F��F m   GG �HH  ��  ��  >  f  < o      ���� 0 thekeywords theKeywords: IJI r  );KLK n )7MNM I  *7��O���� "0 replaceinstring ReplaceInStringO PQP o  *-���� 0 thekeywords theKeywordsQ RSR m  -0TT �UU  \S V��V m  03WW �XX  ��  ��  N  f  )*L o      �� 0 thekeywords theKeywordsJ YZY r  <N[\[ n <J]^] I  =J�~_�}�~ "0 replaceinstring ReplaceInString_ `a` o  =@�|�| 0 thekeywords theKeywordsa bcb m  @Cdd �ee  'c f�{f m  CFgg �hh  \ '�{  �}  ^  f  <=\ o      �z�z 0 thekeywords theKeywordsZ iji r  Oaklk n O]mnm I  P]�yo�x�y "0 replaceinstring ReplaceInStringo pqp o  PS�w�w 0 thekeywords theKeywordsq rsr m  SVtt �uu 0 L i n k e d   w i t h   D e v o n T h i n k ,  s v�vv m  VYww �xx  �v  �x  n  f  OPl o      �u�u 0 thekeywords theKeywordsj yzy r  bt{|{ n bp}~} I  cp�t�s�t "0 replaceinstring ReplaceInString ��� o  cf�r�r 0 thekeywords theKeywords� ��� m  fi�� ��� 0 ,   L i n k e d   w i t h   D e v o n T h i n k� ��q� m  il�� ���  �q  �s  ~  f  bc| o      �p�p 0 thekeywords theKeywordsz ��� r  u���� n u���� I  v��o��n�o "0 replaceinstring ReplaceInString� ��� o  vy�m�m 0 thekeywords theKeywords� ��� m  y|�� ��� , L i n k e d   w i t h   D e v o n T h i n k� ��l� m  |�� ���  �l  �n  �  f  uv� o      �k�k 0 thekeywords theKeywords� ��� l ���j�i�h�j  �i  �h  � ��� l ���g���g  � a [ display dialog "Keywords: " & theKeywords buttons {"�"} default button 1 giving up after 3   � ��� �   d i s p l a y   d i a l o g   " K e y w o r d s :   "   &   t h e K e y w o r d s   b u t t o n s   { " " " }   d e f a u l t   b u t t o n   1   g i v i n g   u p   a f t e r   3� ��� l ���f�e�d�f  �e  �d  � ��c� X  �,��b�� k  �'�� ��� l  ���a���a  � - ' Determine the currently attached file    � ��� N   D e t e r m i n e   t h e   c u r r e n t l y   a t t a c h e d   f i l e  � ��� l ���`�_�^�`  �_  �^  � ��� r  ����� l ����]�\� l ����[�Z� n  ����� 1  ���Y
�Y 
psxp� o  ���X�X 0 thefile theFile�[  �Z  �]  �\  � o      �W�W 0 thepath thePath� ��� l ���V���V  � \ V display dialog "File: " & thePath buttons {"�"} default button 1 -- giving up after 3   � ��� �   d i s p l a y   d i a l o g   " F i l e :   "   &   t h e P a t h   b u t t o n s   { " " " }   d e f a u l t   b u t t o n   1   - -   g i v i n g   u p   a f t e r   3� ��� l ���U�T�S�U  �T  �S  � ��R� Z  �'���Q�P� G  ����� D  ����� o  ���O�O 0 thepath thePath� m  ���� ���  . p d f� D  ����� o  ���N�N 0 thepath thePath� m  ���� ���  . P D F� k  �#�� ��� l ���M�L�K�M  �L  �K  � ��� l  ���J���J  �   Create the command    � ��� (   C r e a t e   t h e   c o m m a n d  � ��� r  ����� o  ���I�I 
0 worker  � o      �H�H 0 thecmd theCmd� ��� r  ����� n ����� I  ���G��F�G "0 replaceinstring ReplaceInString� ��� o  ���E�E 0 thecmd theCmd� ��� m  ���� ���  # # # T I T L E # # #� ��D� o  ���C�C 0 thetitle theTitle�D  �F  �  f  ��� o      �B�B 0 thecmd theCmd� ��� r  ����� n ����� I  ���A��@�A "0 replaceinstring ReplaceInString� ��� o  ���?�? 0 thecmd theCmd� ��� m  ���� ���  # # # A U T H O R # # #� ��>� o  ���=�= 0 	theauthor 	theAuthor�>  �@  �  f  ��� o      �<�< 0 thecmd theCmd� ��� r  ����� n ����� I  ���;��:�; "0 replaceinstring ReplaceInString� ��� o  ���9�9 0 thecmd theCmd� ��� m  ���� ���  # # # K E Y W O R D S # # #� ��8� o  ���7�7 0 thekeywords theKeywords�8  �:  �  f  ��� o      �6�6 0 thecmd theCmd� � � r  � n � I   �5�4�5 "0 replaceinstring ReplaceInString  o   �3�3 0 thecmd theCmd 	 m  

 �  # # # S O U R C E # # #	 �2 o  	�1�1 0 thepath thePath�2  �4    f  �  o      �0�0 0 thecmd theCmd   l �/�.�-�/  �.  �-    r  ! b   b   o  �,�, 0 message   m   �    l �+�* I �)�(
�) .sysoexecTEXT���     TEXT o  �'�' 0 thecmd theCmd�(  �+  �*   o      �&�& 0 message   �% l ""�$�#�"�$  �#  �"  �%  �Q  �P  �R  �b 0 thefile theFile� n  �� 2 ���!
�! 
File o  ��� �  0 thebook theBook�c   7 o   ' (�� 0 thebook theBook 5 � l ..����  �  �  �  �� 0 thebook theBook 2 o    �� 0 thebooks theBooks 0   l 55����  �  �    !"! l 5H#$%# I 5H�&'
� .sysodlogaskr        TEXT& o  56�� 0 message  ' �()
� 
btns( J  9>** +�+ m  9<,, �--  "�  ) �.�
� 
dflt. m  AB�� �  $   giving up after 3   % �// $   g i v i n g   u p   a f t e r   3" 0�0 l II����  �  �  �   # m    11�                                                                                  BDSK  alis    V  Macintosh HD               �I��H+    `BibDesk.app                                                     6��|W        ����  	                TeX     �I��      �`7      `   r  +Macintosh HD:Applications: TeX: BibDesk.app     B i b D e s k . a p p    M a c i n t o s h   H D  Applications/TeX/BibDesk.app  / ��  ��    232 l     ��
�	�  �
  �	  3 454 l     ����  �  �  5 676 i    
898 I      �:�� "0 replaceinstring ReplaceInString: ;<; o      �� 0 astring aString< =>= o      �� 0 oldstr oldStr> ?�? o      � �  0 replstr replStr�  �  9 k     b@@ ABA r     CDC m     EE �FF  D o      ���� 0 	newstring 	newStringB GHG Z    _IJ����I >   KLK o    ���� 0 astring aStringL m    MM �NN  J k   
 [OO PQP O   
 &RSR k    %TT UVU r    WXW 1    ��
�� 
txdlX o      ���� 0 olddelim oldDelimV YZY r    [\[ o    ���� 0 oldstr oldStr\ 1    ��
�� 
txdlZ ]^] l   _`a_ r    bcb n    ded 2   ��
�� 
citme o    ���� 0 astring aStringc o      ���� 0 	foundlist 	foundList`   tokenise the string   a �ff (   t o k e n i s e   t h e   s t r i n g^ g��g r     %hih o     !���� 0 olddelim oldDelimi 1   ! $��
�� 
txdl��  S 1   
 ��
�� 
ascrQ jkj r   ' .lml I  ' ,��n��
�� .corecnte****       ****n o   ' (���� 0 	foundlist 	foundList��  m o      ���� 0 n  k o��o Z   / [pq��rp B   / 2sts o   / 0���� 0 n  t m   0 1���� q r   5 8uvu o   5 6���� 0 astring aStringv o      ���� 0 	newstring 	newString��  r k   ; [ww xyx r   ; Az{z l  ; ?|����| n   ; ?}~} 4   < ?��
�� 
cobj m   = >���� ~ o   ; <���� 0 	foundlist 	foundList��  ��  { o      ���� 0 	newstring 	newStringy ���� Y   B [�������� k   L V�� ��� l  L L������  � N H display dialog "i=" & i & ":" & return & return & (item i of foundList)   � ��� �   d i s p l a y   d i a l o g   " i = "   &   i   &   " : "   &   r e t u r n   &   r e t u r n   &   ( i t e m   i   o f   f o u n d L i s t )� ���� r   L V��� b   L T��� b   L O��� o   L M���� 0 	newstring 	newString� o   M N���� 0 replstr replStr� l  O S������ n   O S��� 4   P S���
�� 
cobj� o   Q R���� 0 i  � o   O P���� 0 	foundlist 	foundList��  ��  � o      ���� 0 	newstring 	newString��  �� 0 i  � m   E F���� � o   F G���� 0 n  ��  ��  ��  ��  ��  H ���� L   ` b�� o   ` a���� 0 	newstring 	newString��  7 ���� l     ��������  ��  ��  ��       ��� ����  � �������� 
0 worker  
�� .aevtoappnull  �   � ****�� "0 replaceinstring ReplaceInString� �� ��������
�� .aevtoappnull  �   � ****��  ��  � ������ 0 thebook theBook�� 0 thefile theFile� I ��1���������������� G���� T W�� d g t w � � � � � � ��� � � � � � � � '��47DGTWdgtw�������������������
����,�������� 0 message  
�� .miscactvnull��� ��� null
�� 
docu
�� 
sele�� 0 thebooks theBooks
�� 
kocl
�� 
cobj
�� .corecnte****       ****
�� 
bfld
�� 
fldv�� 0 thetitle theTitle�� "0 replaceinstring ReplaceInString�� 0 	theauthor 	theAuthor�� 0 thekeywords theKeywords
�� 
File
�� 
psxp�� 0 thepath thePath
�� 
bool�� 0 thecmd theCmd
�� .sysoexecTEXT���     TEXT
�� 
btns
�� 
dflt�� 
�� .sysodlogaskr        TEXT��L�E�O�D*j O*�k/�,E�O�[��l 	kh  �*��/�,E�O)���m+ E�O)�a a m+ E�O)�a a m+ E�O)�a a m+ E�O)�a a m+ E�O)�a a m+ E�O*�a /�,E` O)_ a a m+ E` O)_ a a  m+ E` O)_ a !a "m+ E` O)_ a #a $m+ E` O)_ a %a &m+ E` O*�a '/�,E` (O)_ (a )a *m+ E` (O)_ (a +a ,m+ E` (O)_ (a -a .m+ E` (O)_ (a /a 0m+ E` (O)_ (a 1a 2m+ E` (O)_ (a 3a 4m+ E` (O)_ (a 5a 6m+ E` (O ��a 7-[��l 	kh �a 8,E` 9O_ 9a :
 _ 9a ;a <& jb   E` =O)_ =a >�m+ E` =O)_ =a ?_ m+ E` =O)_ =a @_ (m+ E` =O)_ =a A_ 9m+ E` =O�a B%_ =j C%E�OPY h[OY�oUOP[OY��O�a Da Ekva Fka G HOPU� ��9���������� "0 replaceinstring ReplaceInString�� ����� �  �������� 0 astring aString�� 0 oldstr oldStr�� 0 replstr replStr��  � ������������������ 0 astring aString�� 0 oldstr oldStr�� 0 replstr replStr�� 0 	newstring 	newString�� 0 olddelim oldDelim�� 0 	foundlist 	foundList�� 0 n  �� 0 i  � EM����������
�� 
ascr
�� 
txdl
�� 
citm
�� .corecnte****       ****
�� 
cobj�� c�E�O�� V� *�,E�O�*�,FO��-E�O�*�,FUO�j E�O�k �E�Y "��k/E�O l�kh ��%��/%E�[OY��Y hO�ascr  ��ޭ