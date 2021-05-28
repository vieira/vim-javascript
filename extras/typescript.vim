" Vim syntax file
" Language:     TypeScript
" Maintainer:   João Vieira <vieira@yubo.be>

syntax region tsDefinition contained
  \ start=/\%(?\)\=:/
  \ end=/\%(\s*[,=;)\n]\)\@=/
  \ contains=@tsCluster,tsGeneric
  \ containedin=jsParen,jsClassBlock

syntax keyword tsAssertion as
  \ skipwhite skipempty
  \ nextgroup=@tsCluster
  \ containedin=@jsExpression

syntax region tsArgumentDef contained
  \ start=/\%(?\)\=:/
  \ end=/\%(\s*[,)]\|=>\@!\)\@=/
  \ contains=@tsCluster,tsGeneric

syntax region tsArray contained
  \ matchgroup=tsNoise
  \ start=/\[/
  \ end=/\]/
  \ contains=@tsCluster,jsComment
  \ fold

syntax region tsObject contained
  \ matchgroup=tsNoise
  \ start=/{/
  \ end=/}/
  \ contains=@tsCluster,jsComment
  \ fold

syntax region tsParens contained
  \ matchgroup=tsNoise
  \ start=/(/
  \ end=/)/
  \ contains=@tsCluster
  \ nextgroup=tsArrow
  \ skipwhite keepend extend fold

syntax match tsNoise contained /[:;,<>]/

syntax keyword tsModifier contained
  \ public
  \ private
  \ protected
  \ readonly
  \ override
  \ containedin=jsClassBlock,jsFuncArgs

syntax keyword tsType contained
  \ boolean
  \ number
  \ string
  \ void
  \ null
  \ bigint
  \ any
  \ symbol
  \ object
  \ undefined
  \ unknown
  \ never
  \ Array
  \ Iterable
  \ ReadonlyArray
  \ Partial
  \ Required
  \ Readonly
  \ Record
  \ Pick
  \ Omit
  \ Exclude
  \ Extract
  \ NonNullable
  \ Parameters
  \ ConstructorParameters
  \ ReturnType
  \ InstanceType
  \ ThisParameterType
  \ OmitThisParameter
  \ ThisType
  \ Uppercase
  \ Lowercase
  \ Capitalize
  \ Uncapitalize

syntax keyword tsTypeof contained typeof
  \ skipempty skipwhite
  \ nextgroup=tsType

syntax region tsGeneric
  \ matchgroup=tsNoise
  \ start=/\k\@<=</
  \ end=/>/
  \ contains=@tsCluster
  \ containedin=@jsExpression

syntax region tsGeneric contained
  \ matchgroup=tsNoise
  \ start=/</
  \ end=/>\s*[=(]\@=/
  \ oneline
  \ contains=@tsCluster
  \ containedin=@jsExpression

syntax region tsObjectGeneric contained matchgroup=tsNoise
  \ start=/\k\@<=</
  \ end=/>/
  \ contains=@tsCluster
  \ nextgroup=jsFuncArgs

syntax match tsArrow contained /=>/
  \ skipwhite skipempty
  \ nextgroup=tsType,tsParens

syntax match tsObjectKey contained /[0-9a-zA-Z_$?]*\(\s*:\)\@=/
  \ contains=jsFunctionKey,tsMaybe
  \ skipwhite skipempty
  \ nextgroup=jsObjectValue
  \ containedin=jsObject

syntax keyword tsImportType contained type
  \ skipwhite skipempty
  \ nextgroup=jsModuleAsterisk,jsModuleKeyword,jsModuleGroup

syntax match tsUnionOperator contained /|/
  \ skipwhite skipempty
  \ nextgroup=@tsCluster

syntax match tsIntersectionOperator contained /&/
  \ skipwhite skipempty
  \ nextgroup=@tsCluster

syntax match tsReturn contained /:\s*/
  \ contains=tsNoise
  \ skipwhite skipempty
  \ nextgroup=@tsReturnCluster,tsArrow,tsReturnParens

syntax region tsReturnObject contained
  \ matchgroup=tsNoise
  \ start=/{/
  \ end=/}/
  \ contains=@tsCluster
  \ skipwhite skipempty
  \ nextgroup=jsFuncBlock,tsReturnUnion,tsReturnIntersection
  \ extend fold

syntax region tsReturnArray contained
  \ matchgroup=tsNoise
  \ start=/\[/
  \ end=/\]/
  \ contains=@tsCluster
  \ skipwhite skipempty
  \ nextgroup=jsFuncBlock,tsReturnUnion,tsReturnIntersection
  \ fold

syntax region tsReturnParens contained
  \ matchgroup=tsNoise
  \ start=/(/
  \ end=/)/
  \ contains=@tsCluster
  \ skipwhite skipempty
  \ nextgroup=jsFuncBlock,tsReturnUnion,tsReturnIntersection,tsReturnArrow
  \ fold

syntax match tsReturnArrow contained /=>/
  \ skipwhite skipempty
  \ nextgroup=@tsReturnCluster

syntax match tsReturnKeyword contained /\k\+/
  \ contains=tsType
  \ skipwhite skipempty
  \ nextgroup=tsReturnGroup,jsFuncBlock,tsReturnUnion,tsReturnIntersection,tsReturnArray

syntax region tsReturnGroup contained
  \ matchgroup=tsNoise
  \ start=/</
  \ end=/>/
  \ contains=@tsCluster
  \ skipwhite skipempty
  \ nextgroup=jsFuncBlock,tsReturnUnion,tsReturnIntersection

syntax match tsReturnUnion contained /\s*|\s*/
  \ skipwhite skipempty
  \ nextgroup=@tsReturnCluster,tsArrow,tsReturnParens

syntax match tsReturnIntersection contained /\s*&\s*/
  \ skipwhite skipempty
  \ nextgroup=@tsReturnCluster,tsArrow,tsReturnParens

syntax region tsClassGroup contained
  \ matchgroup=tsNoise
  \ start=/</
  \ end=/>/
  \ contains=@tsCluster
  \ skipwhite skipempty
  \ nextgroup=jsClassBlock

syntax region tsFunctionGroup contained
  \ matchgroup=tsNoise
  \ start=/</
  \ end=/>/
  \ contains=@tsCluster
  \ skipwhite skipempty
  \ nextgroup=jsFuncArgs

syntax region tsClassFunctionGroup contained
  \ matchgroup=tsNoise
  \ start=/</
  \ end=/>/
  \ contains=@tsCluster
  \ skipwhite skipempty
  \ nextgroup=jsFuncArgs

syntax match jsClassFuncName contained /\<\K\k*\ze?\s*[(<]/
  \ contains=tsMaybe
  \ skipwhite skipempty
  \ nextgroup=tsMaybe,jsFuncArgs,tsClassFunctionGroup

syntax match tsObjectFuncName contained /\<\K\k*<\@=/
  \ skipwhite skipempty
  \ nextgroup=tsObjectGeneric
  \ containedin=jsObject

syntax region tsTypeStatement start=/\(\s\+\)\?type\%(\s\+\k\)\@=/ end=/=\@=/
  \ contains=tsTypeKeyword,tsTypeOperator
  \ oneline skipwhite skipempty
  \ nextgroup=tsTypeValue
  \ keepend

syntax region tsTypeValue contained
  \ matchgroup=tsNoise
  \ start=/=/
  \ end=/\%(;\|\n\%(\s*[|&]\)\@!\)/
  \ contains=@tsCluster,tsGeneric,tsMaybe

syntax region tsPropertyTypeValue contained
  \ start=/\%(?\)\=:/
  \ end=/\%(;\|\n\%(\s*[|&]\)\@!\)/
  \ contains=@tsCluster,tsGeneric
  \ containedin=jsClassBlock,jsParen

syntax match tsTypeOperator contained /=/ containedin=tsTypeValue
syntax match tsTypeOperator contained /=/
syntax keyword tsTypeKeyword contained type

syntax match tsClassProperty contained /\<[0-9a-zA-Z_$]*\>:\@=/
  \ skipwhite skipempty
  \ nextgroup=tsClassDef
  \ containedin=jsClassBlock

syntax region tsClassDef contained start=/:/ end=/\%(\s*[,=;)\n]\)\@=/
  \ contains=@tsCluster
  \ skipwhite skipempty
  \ nextgroup=jsClassValue

syntax keyword tsDeclareKeyword declare
  \ skipwhite skipempty
  \ nextgroup=jsFuncName,tsEnumKeyword

syntax keyword tsAbstractKeyword abstract
  \ skipwhite skipempty
  \ nextgroup=jsClassKeyword

syntax keyword tsEnumKeyword enum
  \ skipwhite skipempty
  \ nextgroup=tsEnumName

syntax match tsEnumName contained /\<\K\k*/
  \ skipwhite skipempty
  \ nextgroup=tsEnumBlock

syntax region tsEnumBlock contained
  \ start=/{/
  \ end=/}/
  \ contains=tsEnumProperty,jsNumber,jsFloat,jsString,jsOperator,jsFuncCall
  \ extend fold

syntax match tsEnumProperty contained /\<\K\k*\ze\s*[=,]/
  \ skipwhite skipempty
  \ oneline

syntax keyword tsImplementsKeyword contained implements
  \ skipwhite skipempty
  \ nextgroup=@jsExpression

syntax keyword tsInterfaceKeyword contained interface
syntax match tsInterfaceNoise contained /\./

syntax region tsInterfaceDefinition start=/\<interface\>/ end=/\(\<extends\>\s\+\)\@<!{\@=/
  \ contains=tsInterfaceKeyword,jsExtendsKeyword,jsClassNoise,@jsExpression,tsClassGroup
  \ skipwhite skipempty
  \ nextgroup=jsCommentClass,jsClassBlock,tsClassGroup


syntax match tsMaybe contained /?/

syntax region tsParenAnnotation contained start=/:/ end=/[,=)]\@=/
  \ containedin=jsParen
  \ contains=@tsCluster

syntax cluster tsReturnCluster
  \ contains=tsNoise,tsReturnObject,tsReturnArray,tsReturnKeyword,tsReturnGroup,tsReturnUnion,tsReturnIntersection,tsReturnArrow

syntax cluster tsCluster
  \ contains=tsArray,tsObject,tsNoise,tsTypeof,tsModifier,tsType,tsGeneric,tsMaybe,tsParens,tsIntersectionOperator,tsUnionOperator

if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink tsDefinition           PreProc
  HiLink tsClassDef             TsDefinition
  HiLink tsPropertyTypeValue    TsDefinition
  HiLink tsArgumentDef          TsDefinition
  HiLink tsType                 Type
  HiLink tsTypeof               PreProc
  HiLink tsArray                PreProc
  HiLink tsObject               PreProc
  HiLink tsParens               PreProc
  HiLink tsGeneric              PreProc
  HiLink tsObjectGeneric        TsGeneric
  HiLink tsReturn               PreProc
  HiLink tsReturnKeyword        PreProc
  HiLink tsParenAnnotation      PreProc
  HiLink tsReturnObject         TsReturn
  HiLink tsReturnArray          TsArray
  HiLink tsReturnParens         TsParens
  HiLink tsReturnGroup          TsGeneric
  HiLink tsFunctionGroup        PreProc
  HiLink tsClassGroup           PreProc
  HiLink tsClassFunctionGroup   PreProc
  HiLink tsArrow                PreProc
  HiLink tsReturnArrow          PreProc
  HiLink tsTypeKeyword          Keyword
  HiLink tsTypeStatement        JsFuncName
  HiLink tsTypeOperator         Operator
  HiLink tsMaybe                PreProc
  HiLink tsClassProperty        JsClassProperty
  HiLink tsModule               PreProc
  HiLink tsAssertion            Keyword
  HiLink tsEnumKeyword          Keyword
  HiLink tsDeclareKeyword       Keyword
  HiLink tsAbstractKeyword      PreProc
  HiLink tsInterfaceKeyword     Keyword
  HiLink tsInterfaceDefinition  JsFuncName
  HiLink tsImplementsKeyword    Keyword
  HiLink tsModifier             JsModifier
  HiLink tsNoise                Noise
  HiLink tsObjectKey            JsObjectKey
  HiLink tsUnionOperator        JsOperator
  HiLink tsIntersectionOperator JsOperator
  HiLink tsReturnUnion          JsOperator
  HiLink tsReturnIntersection   JsOperator
  HiLink tsImportType           PreProc
  HiLink tsTypeValue            PreProc
  HiLink tsObjectFuncName       JsObjectFuncName
  HiLink tsEnumName             JsFuncName
  HiLink tsEnumProperty         JsClassProperty
  delcommand HiLink
endif
