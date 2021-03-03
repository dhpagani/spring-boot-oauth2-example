import { CrudController, CrudService } from '@nestjsx/crud';
import AbstractEntity from 'src/domain/core/abstract.entity';
export abstract class AbstractController<T extends AbstractEntity>
    implements CrudController<T> {
    constructor(public service: CrudService<T>) {}
}
